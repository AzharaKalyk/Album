import UIKit

class ViewController: UIViewController {
    enum Metric {
        static let layoutIndent: CGFloat = 12
        static let leftIndentLayout: CGFloat = 6
        static let photoRadius: CGFloat = 10
        static let topIndentVerticalSection: CGFloat = 20
    }

    private let model = DataManager.shared.createModels()
    
    // MARK: - Properties

    private lazy var collection: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        collectionView.register(AlbumCell.self, forCellWithReuseIdentifier: AlbumCell.indetifier)
        collectionView.register(TabelCell.self, forCellWithReuseIdentifier: TabelCell.indetifier)
        collectionView.dataSource = self
        collectionView.backgroundColor = .white
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
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
        
        collection.register(SectionHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "SectionHeader")
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
    
// MARK: - buttonTapped
    
    @objc private func addButtonTapped() {
    }
}

// MARK: - UICollectionViewDataSource

extension ViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        model.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return model[0].count
        case 1:
            return model[1].count
        case 2:
            return model[2].count
        case 3:
            return model[3].count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let data = model[indexPath.section][indexPath.item]
        switch indexPath.section {
        case 0, 1:
            let item = collectionView.dequeueReusableCell(withReuseIdentifier: AlbumCell.indetifier, for: indexPath) as? AlbumCell
            item?.photoImageView.image = UIImage(named: data.image)
            item?.namePhotoLabel.text = data.name
            item?.numberPhotosLabel.text = data.description
            
            return item ?? UICollectionViewCell()
        default:
            let item = collectionView.dequeueReusableCell(withReuseIdentifier: TabelCell.indetifier, for: indexPath) as? TabelCell
            item?.iconView.image = UIImage(systemName: data.image)
            item?.nameLabel.text = data.name
            item?.numberPhotosLabel.text = data.description
            return item ?? UICollectionViewCell()
        }
    }
}

