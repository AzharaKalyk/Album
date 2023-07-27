import UIKit

// MARK: - UICollectionViewDelegateFlowLayout

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            if let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: SectionHeaderView.identifier, for: indexPath) as? SectionHeaderView {
                
                let sectionModel: SectionModel = SectionModel.sectionModels[indexPath.section]
                headerView.titleLabel.text = sectionModel.title
                headerView.allButton.setTitle(sectionModel.buttonIsHidden, for: .normal)
                
                return headerView
            }
        } else if kind == SectionSeparatorView.elementKind {
            if let separatorView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: SectionSeparatorView.identifier, for: indexPath) as? SectionSeparatorView {
                
                return separatorView
            }
        }
        return UICollectionReusableView()
    }
}
