import UIKit

final class SectionHeaderView: UICollectionReusableView {
    
    static let identifier = "SectionHeader"
    
    // MARK: - Elements
    
   private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textAlignment = .left
        
        return label
    }()
    
    private lazy var allButton: UIButton = {
        let button = UIButton(type: .system)
        
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
    
    func configure(title: String, isButtonHidden: String?) {
        titleLabel.text = title
        if let buttonTitle = isButtonHidden {
            allButton.isHidden = false
            allButton.setTitle(buttonTitle, for: .normal)
        } else {
            allButton.isHidden = true
        }
    }
}

// MARK: -UICollectionReusableView

final class SectionSeparatorView: UICollectionReusableView {
    static let identifier = "SectionSeparatorView"
    static let elementKind = "SectionElementKind"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemGray4
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
