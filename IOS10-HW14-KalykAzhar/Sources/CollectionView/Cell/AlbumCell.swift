import UIKit

final class AlbumCell: UICollectionViewCell {
    
    static let indetifier = "AlbumCell"
    
    // MARK: - Constants
    
    enum Metric {
        static let indent: CGFloat = 5
        static let photoRadius: CGFloat = 10
    }
    
    // MARK: - Properties
    
    private lazy var photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = Metric.photoRadius
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    private lazy var namePhotoLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 17)
        
        return label
    }()
    
    private lazy var numberPhotosLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 17)
        label.textColor = .gray
        
        return label
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setupHierarchy() {
        contentView.addSubviewsForAutoLayout([
            photoImageView,
            namePhotoLabel,
            numberPhotosLabel,
        ])
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            photoImageView.topAnchor.constraint(equalTo: topAnchor),
            photoImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            photoImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            photoImageView.heightAnchor.constraint(equalTo: photoImageView.widthAnchor),
            namePhotoLabel.topAnchor.constraint(equalTo: photoImageView.bottomAnchor, constant: Metric.indent),
            numberPhotosLabel.topAnchor.constraint(equalTo: namePhotoLabel.bottomAnchor, constant: Metric.indent),
        ])
    }
    
    // MARK: - Configuration
    
    func configuration(model: ItemModel) {
        photoImageView.image = UIImage(named: model.image)
        namePhotoLabel.text = model.name
        numberPhotosLabel.text = model.description
    }
}
