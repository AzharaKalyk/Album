import UIKit

// MARK: - UICollectionViewDataSource

extension ViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        model.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return model[section].items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let sectionModel = model[indexPath.section]
        let itemModel = sectionModel.items[indexPath.item]
        
        if let image = UIImage(named: itemModel.image) {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AlbumCell.indetifier, for: indexPath) as? AlbumCell {
                cell.photoImageView.image = image
                cell.namePhotoLabel.text = itemModel.name
                cell.numberPhotosLabel.text = itemModel.description
                
                return cell
            }
        } else {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TabelCell.indetifier, for: indexPath) as? TabelCell {
                cell.iconView.image = UIImage(systemName: itemModel.image)
                cell.nameLabel.text = itemModel.name
                cell.numberPhotosLabel.text = itemModel.description
                
                return cell
            }
        }
        
        fatalError("Failed to dequeue cell.")
    }
}
