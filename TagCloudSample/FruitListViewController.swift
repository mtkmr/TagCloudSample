//
//  FruitListViewController.swift
//  TagCloudSample
//
//  Created by Masato Takamura on 2022/08/14.
//

import UIKit

final class FruitListViewController: UIViewController {

    private let fruits: [String] = ["りんご", "ぶどう", "パイナップル", "もも", "スイカ", "ドラゴンフルーツ", "メロン", "バナナ", "さくらんぼ", "オレンジ", "みかん", "いちご", "ブラックベリー", "マスカット", "マンゴー", "キウイ", "ブルーベリー"]

    private let collectionView: TagCloudCollectionView = TagCloudCollectionView()

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "フルーツ一覧"
        let closeButton = UIBarButtonItem(image: UIImage(systemName: "xmark"),
                                          style: .done,
                                          target: self,
                                          action: #selector(tappedCloseButton(_:)))
        closeButton.tintColor = .systemBlue
        navigationItem.rightBarButtonItem = closeButton

        collectionView.dataSource = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false

        view.backgroundColor = .systemBackground
        view.addSubview(collectionView)

        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }

    @objc private func tappedCloseButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
}

// MARK: - UICollectionViewDataSource
extension FruitListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        fruits.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TagCloudCollectionViewCell.className, for: indexPath) as? TagCloudCollectionViewCell else { return UICollectionViewCell() }
        cell.configure(name: fruits[indexPath.row])
        return cell
    }
}
