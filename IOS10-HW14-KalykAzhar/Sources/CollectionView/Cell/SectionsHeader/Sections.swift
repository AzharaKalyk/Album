import UIKit

// MARK: - Enum

enum Sections: Int {
    case first = 0
    case second = 1
    case third = 2
    case fourth = 3
}

// MARK: - Extension

extension ViewController {
    private func firstSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: Metric.layoutIndent, leading: Metric.leftIndentLayout, bottom: .zero, trailing: Metric.leftIndentLayout)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .estimated(192), heightDimension: .absolute(399))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: item, count: 2)
        group.interItemSpacing = .fixed(88)
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = .zero
        section.contentInsets = NSDirectionalEdgeInsets(top: .zero, leading: Metric.layoutIndent, bottom: 112, trailing: Metric.layoutIndent)
        section.orthogonalScrollingBehavior = .paging
        section.contentInsets.leading = Metric.layoutIndent
        
        let sectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(80))
        let sectionHeaderSupplementary = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: sectionHeaderSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        sectionHeaderSupplementary.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 8, trailing: 20)
        section.boundarySupplementaryItems = [sectionHeaderSupplementary]
        
        return section
    }
    
    private func secondSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: .zero, leading: Metric.leftIndentLayout, bottom: .zero, trailing: Metric.leftIndentLayout)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .estimated(192), heightDimension: .absolute(186))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: item, count: 1)
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: .zero, leading: Metric.layoutIndent, bottom: 60, trailing: Metric.layoutIndent)
        section.orthogonalScrollingBehavior = .paging
        section.contentInsets.leading = Metric.layoutIndent
        
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(45))
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        header.zIndex = Int.max
        section.boundarySupplementaryItems = [header]
        
        return section
    }
    
    private func thirdSection() -> NSCollectionLayoutSection {
        
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(52))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            item.contentInsets = NSDirectionalEdgeInsets(top: Metric.topIndentVerticalSection, leading: .zero, bottom: .zero, trailing: .zero)
            
            let group = NSCollectionLayoutGroup.vertical(layoutSize: itemSize, subitem: item, count: 1)
            
            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: Metric.layoutIndent, bottom: 20, trailing: 0)
            
            let sectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(80))
            let sectionHeaderSupplementary = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: sectionHeaderSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
            section.boundarySupplementaryItems = [sectionHeaderSupplementary]
            
            return section
        }
    
    private func fourthSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(52))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: Metric.topIndentVerticalSection, leading: Metric.layoutIndent, bottom: .zero, trailing:. zero)
        
        let group = NSCollectionLayoutGroup.vertical(layoutSize: itemSize, subitem: item, count: 1)
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: .zero, leading: Metric.layoutIndent, bottom: 20, trailing: .zero)
        
        let sectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(80))
        let sectionHeaderSupplementary = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: sectionHeaderSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        section.boundarySupplementaryItems = [sectionHeaderSupplementary]
        
        return section
    }


    // MARK: - UICollectionViewLayout
    
    func createLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            guard let sectionLayout = Sections(rawValue: sectionIndex) else { return nil }
            
            switch sectionLayout {
            case .first:
                return self.firstSection()
            case .second:
                return self.secondSection()
            case .third:
                return self.thirdSection()
            case .fourth:
                return self.fourthSection()
            }
        }
        
        return layout
    }
}
