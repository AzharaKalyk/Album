import UIKit

final class SectionHeaderView: UICollectionReusableView {
    
    // MARK: - Elements
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textAlignment = .left
        
        return label
    }()
    
    lazy var allButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Все", for: .normal)
        
        return button
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        allButton.translatesAutoresizingMaskIntoConstraints = false
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    
    private func setupHierarchy() {
        addSubview(titleLabel)
        addSubview(allButton)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 1),
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            allButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            allButton.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
    
}

// MARK: - UICollectionViewDelegateFlowLayout

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "SectionHeader", for: indexPath) as! SectionHeaderView
            
            switch indexPath.section {
            case 0:
                headerView.titleLabel.text = "Мои альбомы"
                headerView.allButton.isHidden = false
            case 1:
                headerView.titleLabel.text = "Общие альбомы"
                headerView.allButton.isHidden = true
            case 2:
                headerView.titleLabel.text = "Типы медиафайлов"
                headerView.allButton.isHidden = true
            case 3:
                headerView.titleLabel.text = "Другое"
                headerView.allButton.isHidden = true
            default:
                headerView.titleLabel.text = ""
                headerView.allButton.isHidden = true
            }
            
            return headerView
        }
        return UICollectionReusableView()
    }
}

final class SectionSeparatorView: UICollectionReusableView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemGray4
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
