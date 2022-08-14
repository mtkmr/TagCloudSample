//
//  TagCloudCollectionView.swift
//  TagCloudSample
//
//  Created by Masato Takamura on 2022/08/14.
//

import UIKit

final class TagCloudCollectionView: UICollectionView {

    init() {
        let layout = LeftAlignedCollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.minimumInteritemSpacing = 8
        layout.minimumLineSpacing = 12
        layout.sectionInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        super.init(frame: .zero, collectionViewLayout: layout)

        backgroundColor = .systemBackground

        allowsMultipleSelection = true

        register(TagCloudCollectionViewCell.self, forCellWithReuseIdentifier: TagCloudCollectionViewCell.className)
        translatesAutoresizingMaskIntoConstraints = false
    }

    required init?(coder: NSCoder) {
        nil
    }
}

// セルを左詰にするカスタムレイアウトクラス
final class LeftAlignedCollectionViewFlowLayout: UICollectionViewFlowLayout {
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        guard let attributes: [UICollectionViewLayoutAttributes] = super.layoutAttributesForElements(in: rect) else { return nil }
        var currentRowY: CGFloat = -1.0
        var currentRowX: CGFloat = 0
        for attribute in attributes where attribute.representedElementCategory == .cell {
            if currentRowY != attribute.frame.origin.y {
                currentRowY = attribute.frame.origin.y
                currentRowX = sectionInset.left
            }
            attribute.frame.origin.x = currentRowX
            currentRowX += attribute.frame.width + minimumInteritemSpacing
        }
        return attributes
    }
}
