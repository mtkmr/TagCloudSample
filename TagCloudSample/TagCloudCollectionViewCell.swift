//
//  TagCloudCollectionViewCell.swift
//  TagCloudSample
//
//  Created by Masato Takamura on 2022/08/14.
//

import UIKit

final class TagCloudCollectionViewCell: UICollectionViewCell {

    static var className: String {
        String(describing: TagCloudCollectionViewCell.self)
    }

    private let nameLabel: UILabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)

        nameLabel.font = .systemFont(ofSize: 12, weight: .regular)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false

        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.systemBlue.cgColor
        contentView.layer.cornerRadius = 8
        contentView.addSubview(nameLabel)

        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            nameLabel.heightAnchor.constraint(equalToConstant: 17),
        ])
    }

    required init?(coder: NSCoder) {
        nil
    }

    func configure(name: String) {
        contentView.backgroundColor = isSelected ? .systemBlue : .systemBackground
        nameLabel.textColor = isSelected ? .white : .systemBlue
        nameLabel.text = name
    }

    override var isSelected: Bool {
        didSet {
            nameLabel.textColor = isSelected ? .white : .systemBlue
            contentView.backgroundColor = isSelected ? .systemBlue : .systemBackground
        }
    }
}
