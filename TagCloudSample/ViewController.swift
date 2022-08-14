//
//  ViewController.swift
//  TagCloudSample
//
//  Created by Masato Takamura on 2022/08/14.
//

import UIKit

final class ViewController: UIViewController {

    private let showFruitListButton: UIButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()

        showFruitListButton.setTitle("Show Fruit", for: .normal)
        showFruitListButton.setTitleColor(.white, for: .normal)
        showFruitListButton.backgroundColor = .systemBlue
        showFruitListButton.layer.cornerRadius = 8
        showFruitListButton.addTarget(self, action: #selector(showFruitList(_:)), for: .touchUpInside)
        showFruitListButton.translatesAutoresizingMaskIntoConstraints = false

        view.backgroundColor = .systemBackground
        view.addSubview(showFruitListButton)

        NSLayoutConstraint.activate([
            showFruitListButton.heightAnchor.constraint(equalToConstant: 44),
            showFruitListButton.widthAnchor.constraint(equalToConstant: 240),
            showFruitListButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            showFruitListButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }

    @objc private func showFruitList(_ sender: UIButton) {
        let vc = FruitListViewController()
        let nc = UINavigationController(rootViewController: vc)
        present(nc, animated: true, completion: nil)
    }
}

