import UIKit

final class TabelCell: UICollectionViewCell {
    
    static let indetifier = "TabelCell"
    
    // MARK: - Constants
    
    enum Metric {
        static let indent: CGFloat = 4
        static let lineHeight: CGFloat = 1
        static let lineIndent: CGFloat = 48
        static let iconSize: CGFloat = 24
    }
    // MARK: - Properties
    
    private lazy var iconView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 20, weight: .regular)
        label.textColor = .systemBlue
        
        return label
    }()
    
    private lazy var numberPhotosLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 17, weight: .regular)
        label.textColor = .gray
        
        return label
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.layer.masksToBounds = true
        let image = UIImage(systemName: "chevron.right", withConfiguration: UIImage.SymbolConfiguration(pointSize: 16, weight: .semibold))?.withTintColor(.systemGray4, renderingMode: .alwaysOriginal)
        button.setImage(image, for: .normal)
        
        return button
    }()
    
    private lazy var lineSeparators: UIView = {
        let line = UIView()
        line.backgroundColor = .systemGray4
        line.translatesAutoresizingMaskIntoConstraints = false
        
        return line
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    
    func setupHierarchy() {
        contentView.addSubviewsForAutoLayout([
            iconView,
            lineSeparators,
            nameLabel,
            button,
            numberPhotosLabel,
        ])
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            iconView.heightAnchor.constraint(equalToConstant: Metric.iconSize),
            iconView.widthAnchor.constraint(equalToConstant: Metric.iconSize),
            iconView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            iconView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metric.indent),
            lineSeparators.topAnchor.constraint(equalTo: self.bottomAnchor),
            lineSeparators.heightAnchor.constraint(equalToConstant: Metric.lineHeight),
            lineSeparators.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metric.lineIndent),
            lineSeparators.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            nameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metric.lineIndent),
            button.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            button.heightAnchor.constraint(equalToConstant: Metric.iconSize),
            button.widthAnchor.constraint(equalToConstant: Metric.iconSize),
            button.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor, constant: -Metric.indent),
            numberPhotosLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            numberPhotosLabel.trailingAnchor.constraint(equalTo: button.leadingAnchor, constant: -Metric.lineHeight),
        ])
    }
    
    // MARK: - Configuration
    
    func configuration(model: ItemModel) {
            if let systemSymbol = UIImage(systemName: model.image) {
                iconView.image = systemSymbol
            } else {
                iconView.image = UIImage(named: "")
            }
            nameLabel.text = model.name
            numberPhotosLabel.text = model.description
        }
    }
