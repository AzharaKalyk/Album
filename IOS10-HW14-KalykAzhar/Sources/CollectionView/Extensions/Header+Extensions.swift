import UIKit

// MARK: - UICollectionViewDelegateFlowLayout

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: SectionHeaderView.identifier, for: indexPath) as? SectionHeaderView else {
                return UICollectionReusableView()
            }
            
            let sectionModel: SectionModel = SectionModel.sectionModels[indexPath.section]
            headerView.configure(title: sectionModel.title, isButtonHidden: sectionModel.buttonIsHidden)
            
            return headerView
        } else if kind == SectionSeparatorView.elementKind {
            guard let separatorView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: SectionSeparatorView.identifier, for: indexPath) as? SectionSeparatorView else {
                return UICollectionReusableView()
            }
            
            return separatorView
        }
        return UICollectionReusableView()
    }
}
