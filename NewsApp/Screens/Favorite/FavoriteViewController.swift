//
//
// NewsApp
// FavoriteViewController.swift
// 
// Created by Alexander Kist on 15.10.2023.
//

import UIKit

final class FavoriteViewController: UIViewController {

    private let label = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        setupViews()
        setConstraints()
    }

    private func setupViews() {
        view.addSubview(label)
        label.text = "Избранное"
        label.font = UIFont(name: TextFont.NewYork.bold.rawValue, size: 20)
        label.textColor = .red
        label.translatesAutoresizingMaskIntoConstraints = false

    }

    private func setConstraints() {
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

}
