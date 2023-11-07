//
//
// NewsApp
// MenuButtonCollectionViewCell.swift
// 
// Created by Alexander Kist on 19.10.2023.
//

import UIKit

final class MenuCollectionViewCell: UICollectionViewCell {

    lazy var  menuButton: UIButton = {
        let button = UIButton()
        button.tintColor = .white
        button.titleLabel?.font = UIFont(name: TextFont.Nunito.semiBold.rawValue, size: 14)
        button.addTarget(self, action: #selector(menuButtonTapped), for: .touchUpInside)
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    override func layoutSubviews() {
      super.layoutSubviews()
      layer.cornerRadius = bounds.height / 2
      layer.masksToBounds = true
    }

    @objc func menuButtonTapped() {
        print("menuButtonTapped")
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)

    }

    private func setupViews() {
        backgroundColor = UIColor(named: ColorName.mainColor.rawValue)

        contentView.addSubview(menuButton)

        menuButton.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
    }

    func configure(with label: String) {
        menuButton.setTitle(label, for: .normal)
    }
}
