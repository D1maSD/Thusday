//
//  AppUsersViewController.swift
//  Nearby
//
//  Created by Мельник Дмитрий on 18.08.2022.
//

import Foundation
import UIKit


class UsersViewController: ViewController {
    
    var diffableDataSource: UICollectionViewDiffableDataSource<UsersSection, UsersItem>?
    var collectionView: UICollectionView!
    var viewModel: UsersViewModel?
//    var viewModel: ChatScreenViewModel?

    enum UsersSection: Int, CaseIterable {
        case active
    }
    
    var users = Bundle.main.decode([UsersItem].self, from: "users.json")
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.barTintColor = .systemGray
        navigationController?.navigationBar.shadowImage = UIImage()
        let searchController = UISearchController(searchResultsController: nil)
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
       }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpCollectionView()
        setupNavigationBar()
        setUpDiffableDataSource()
        reloadData()
        
    }
    
    func setUpDiffableDataSource() {
        diffableDataSource = UICollectionViewDiffableDataSource<UsersSection, UsersItem>(collectionView: collectionView, cellProvider: { (collectionView, indexPath, item) -> UICollectionViewCell? in

            guard let section = UsersSection(rawValue: indexPath.section) else { fatalError("Section index out of range") }
            switch section {
            case .active:
//                return self.viewModel?.createCell(cell: WaitingChatCell.self, for: item, for: indexPath, collectionView: collectionView)
                
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "usersCell", for: indexPath)
                cell.backgroundColor = .systemBlue
                return cell
            }
        })
    }
    
    private func reloadData() {
        var snapShot = NSDiffableDataSourceSnapshot<UsersSection, UsersItem>()
        snapShot.appendSections([.active])
        snapShot.appendItems(users, toSection: .active)
        diffableDataSource?.apply(snapShot)
    }
}


extension UsersViewController {
    
    private func setUpCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: setUpCompositionalLayout())
        collectionView.backgroundColor = .systemPink
//        collectionView.register(WaitingChatCell.self, forCellWithReuseIdentifier: WaitingChatCell.reuseId)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "usersCell")
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.view.addSubview(collectionView)
    }
}

extension UsersViewController {
    
    private func setUpCompositionalLayout() -> UICollectionViewLayout {
        // create compositional layout
        let layout = UICollectionViewCompositionalLayout { [weak self]
            sectionIndex, layoutInvayroment in
            guard let secton = UsersSection(rawValue: sectionIndex) else { fatalError("sectionIndex out of range") }
            switch secton {
            case .active:
                return self?.usersSectionsLayout()
            }
        }
        return layout
    }
    
    private func usersSectionsLayout() -> NSCollectionLayoutSection {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 7.5, bottom: 0, trailing: 7.5)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(0.6))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)
        let spacing = CGFloat(15)
        let section = NSCollectionLayoutSection(group: group)
        group.interItemSpacing = .fixed(spacing)
        section.interGroupSpacing = spacing
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 15)

        return section
    }
}

// MARK: Search bar
extension UsersViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
    }
}

// MARK: Create canvas
import SwiftUI

struct ListVCProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        let tabBarVC = UsersViewController()
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<ListVCProvider.ContainerView>) -> UsersViewController {
            return tabBarVC
        }
        
        func updateUIViewController(_ uiViewController: ListVCProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<ListVCProvider.ContainerView>) {
            
        }
    }
}
