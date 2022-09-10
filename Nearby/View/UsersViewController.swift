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
    var flag: Bool?

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
        reloadData(with: String())
    }
    
    private func configure<T: UsersChatCell>(cellType: T.Type, with value: UsersItem, for indexPath: IndexPath) -> T {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellType.reuseId, for: indexPath) as? T else { fatalError("Unable to dequeue \(cellType)") }
        cell.configure(value: value)
        return cell
    }
    
    func setUpDiffableDataSource() {
        diffableDataSource = UICollectionViewDiffableDataSource<UsersSection, UsersItem>(collectionView: collectionView, cellProvider: { (collectionView, indexPath, item) -> UICollectionViewCell? in

            guard let section = UsersSection(rawValue: indexPath.section) else { fatalError("Section index out of range") }
            switch section {
            case .active:
                
               return self.configure(cellType: UsersChatCell.self, with: item, for: indexPath)
     
//                    self.viewModel?.createCell(cell: UsersChatCell.self, for: item, for: indexPath, collectionView: collectionView) {
//                    self.flag = true
//                    print("true")
//                    return cell
//                 else {
//                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "usersCell", for: indexPath)
//                    cell.backgroundColor = .systemBlue
//                    self.flag = false
//                    print("false")
//                    return cell
//                }
            }
        })
        
//        diffableDataSource.didselectite
    }
    
    
    
    private func reloadData(with text: String) {
        
       let filtered = users.filter { user in
            user.filteredData(filtered: text)
        }

        var snapShot = NSDiffableDataSourceSnapshot<UsersSection, UsersItem>()
        snapShot.appendSections([.active])
        snapShot.appendItems(filtered, toSection: .active)
        print(users.count)
        diffableDataSource?.apply(snapShot)
    }
}


extension UsersViewController {
    
    private func setUpCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: setUpCompositionalLayout())
        collectionView.backgroundColor = .systemPink
        collectionView.register(UsersChatCell.self, forCellWithReuseIdentifier: UsersChatCell.reuseId)
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
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(0.56))
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
        reloadData(with: searchText)
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
