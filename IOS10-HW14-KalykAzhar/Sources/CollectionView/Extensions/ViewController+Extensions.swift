import UIKit

// MARK: - UICollectionViewDataSource

extension ViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        model.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        model[section].items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
           let model = model[indexPath.section].items[indexPath.item]
           
           switch indexPath.section {
           case 0, 1:
               guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AlbumCell.indetifier, for: indexPath) as? AlbumCell else { return UICollectionViewCell() }
               cell.configuration(model: model)
               return cell
           default:
               guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TabelCell.indetifier, for: indexPath) as? TabelCell else { return UICollectionViewCell() }
               cell.configuration(model: model)
               return cell
           }
       }
   }
