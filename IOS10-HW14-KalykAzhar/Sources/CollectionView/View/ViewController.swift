import UIKit

class ViewController: UIViewController {
    enum Metric {
        static let layoutIndent: CGFloat = 12
        static let leftIndentLayout: CGFloat = 6
        static let photoRadius: CGFloat = 10
        static let topIndentVerticalSection: CGFloat = 20
    }
    
    let model = SectionModel.sectionModels
    
    // MARK: - Properties
    
    private lazy var collection: UICollectionView = {
        let layout = createLayout()
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(AlbumCell.self, forCellWithReuseIdentifier: AlbumCell.indetifier)
        collection.register(TabelCell.self, forCellWithReuseIdentifier: TabelCell.indetifier)
        collection.register(SectionHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SectionHeaderView.identifier)
        collection.dataSource = self
        collection.delegate = self
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.register(SectionSeparatorView.self, forSupplementaryViewOfKind: SectionSeparatorView.elementKind, withReuseIdentifier: SectionSeparatorView.identifier)
        
        return collection
    }()
    
    private lazy var addPlusButton: UIBarButtonItem = {
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped))
        addButton.tintColor = .systemBlue
        
        return addButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupHierarchy()
        setupLayout()
    }
    
    // MARK: - Setup
    
    private func setupView() {
        view.backgroundColor = .white
        navigationItem.leftBarButtonItem = addPlusButton
    }
    
    private func setupHierarchy() {
        view.addSubview(collection)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            collection.topAnchor.constraint(equalTo: view.topAnchor),
            collection.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collection.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collection.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    // MARK: - Actions
    
    @objc private func addButtonTapped() {}
}
