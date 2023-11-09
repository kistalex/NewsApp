//
//
// NewsApp
// NotificationButton.swift
//
// Created by Alexander Kist on 15.10.2023.
//

import UIKit

final class NotificationButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = bounds.width / 2
    }

    private func setupButton() {
        let image = UIImage(named: "BellIcon")
        setImage(image, for: .normal)
        backgroundColor = UIColor.main
        contentMode = .scaleAspectFit
        tintColor = .white
        clipsToBounds = true
    }
}
