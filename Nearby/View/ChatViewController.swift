




class ChatViewController: UIViewController {
    
    var collectionView: UICollectionView!
    var viewModel: ChatScreenViewModel?
    
    // create section for difDataSource
    enum Section: Int, CaseIterable {
        case waitingChat
        case activeChat
        
        func createHeader() -> String {
            switch self {
            case .waitingChat:
                return "Waiting chat"
            case .activeChat:
                return "Active chat"
            }
        }
    }
    
    var diffableDataSource: UICollectionViewDiffableDataSource<Section, ActiveItem>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupCollectionView()
        setUpDiffbleDataSource()
        createSnapShot()
    }
    
    
    private func configure<T: ActiveChatCell>(cellType: T.Type, with value: ActiveItem, for indexPath: IndexPath) -> T {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellType.reuseId, for: indexPath) as? T else { fatalError("Unable to dequeue \(cellType)") }
        cell.configure(value: value)
        return cell
    }
    
    private func configureTwo<T: WaitingChatCell>(cellType: T.Type, with value: ActiveItem, for indexPath: IndexPath) -> T {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellType.reuseId, for: indexPath) as? T else { fatalError("Unable to dequeue \(cellType)") }
        cell.configure(value: value)
        return cell
    }
    
    func setUpDiffbleDataSource() {
        
        diffableDataSource = UICollectionViewDiffableDataSource<Section, ActiveItem>(collectionView: collectionView, cellProvider: { [self] collectionView, indexPath, itemIdentifier in
            
            guard let section = Section(rawValue: indexPath.section) else { fatalError("Out of section") }
            switch section {
            case .activeChat:
//                return viewModel?.createCell(cell: ActiveChatCell.self, for: itemIdentifier, for: indexPath, collectionView: collectionView)
               return self.configure(cellType: ActiveChatCell.self, with: itemIdentifier, for: indexPath)
            case .waitingChat:
                return self.configureTwo(cellType: WaitingChatCell.self, with: itemIdentifier, for: indexPath)
            }
        })
        //#5 setUp supplementaryViewProvider

        diffableDataSource?.supplementaryViewProvider = { collectionView, elementKind, indexPath in
            
            guard let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: elementKind, withReuseIdentifier: SectionHeader.reuseId, for: indexPath) as? SectionHeader else {  fatalError("Not mach elementKind") }
            guard let section = Section(rawValue: indexPath.section) else { fatalError("No mach section") }
            sectionHeader.configure(title: Section.createHeader(section)(), textColor: UIColor.systemGray, font: UIFont.avenir26()!)
            return sectionHeader
        }
    }
    
    var activeChat = Bundle.main.decode([ActiveItem].self, from: "activeChats.json")
    var waitingChat = Bundle.main.decode([ActiveItem].self, from: "waitingChats.json")
    
    
    func createSnapShot() {
        
        var snapShot = NSDiffableDataSourceSnapshot<Section, ActiveItem>()
        snapShot.appendSections([.waitingChat, .activeChat])
        snapShot.appendItems(waitingChat, toSection: .waitingChat)
        snapShot.appendItems(activeChat, toSection: .activeChat)
        diffableDataSource?.apply(snapShot)
    }
    
    
    private func setupCollectionView() {
        collectionView = UICollectionView(
            frame: view.bounds,
            collectionViewLayout: createCompositionalLayout()
        )
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = .white
        view.addSubview(collectionView)
        
        collectionView.register(ActiveChatCell.self, forCellWithReuseIdentifier: ActiveChatCell.reuseId)
        collectionView.register(WaitingChatCell.self, forCellWithReuseIdentifier: WaitingChatCell.reuseId)
        
        collectionView.register(
            SectionHeader.self, forSupplementaryViewOfKind:
                UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: SectionHeader.reuseId)
    }
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource

extension ChatViewController: UICollectionViewDelegateFlowLayout {
    // create a compositional Layout
    // section - group - item - size
    func createCompositionalLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { [weak self] sectionIndex, layoutEnvironment in
            guard let section = Section(rawValue: sectionIndex) else { fatalError("Section out of range") }
            switch section {
            case .waitingChat:
                return self?.wainitgChatsLayout()
            case .activeChat:
                return self?.activeChatsLayout()
            }
        }
        return layout
    }
    
    
    func activeChatsLayout() -> NSCollectionLayoutSection {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(86))
        //#1 create item
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        //#4 setUp group size
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(86))
        //#3 create group
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets.init(top: 0, leading: 0, bottom: 10, trailing: 0)
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20)
        section.interGroupSpacing = 16
        section.boundarySupplementaryItems = [createHeader()]

        return section
    }
    
    func wainitgChatsLayout() -> NSCollectionLayoutSection {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        //#1 create item
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        //#4 setUp group size
        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(88), heightDimension: .absolute(88))
        //#3 create group
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        // #2 create sectionHeader items array
        
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0)
        section.orthogonalScrollingBehavior = .continuous
        section.interGroupSpacing = 16
        
        // #1 create boundary items array
        let header = createHeader()
        section.boundarySupplementaryItems = [header]
        
        return section
    }
    
    private func createHeader() -> NSCollectionLayoutBoundarySupplementaryItem {
        let sectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(1))
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: sectionHeaderSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        return sectionHeader
    }
}

// MARK: - SwiftUI
import SwiftUI

struct ChatVCProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        let tabBarVC = ChatViewController()
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<ChatVCProvider.ContainerView>) -> ChatViewController {
            return tabBarVC
        }
        
        func updateUIViewController(_ uiViewController: ChatVCProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<ChatVCProvider.ContainerView>) {
            
        }
    }
}

