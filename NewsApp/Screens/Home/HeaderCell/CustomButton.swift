//
//
// NewsApp
// CustomButton.swift
// 
// Created by Alexander Kist on 15.10.2023.
//

import UIKit
import SnapKit

final class CustomButton: UIButton {
    private let buttonText = UILabel()
    private let iconImage = UIImageView()

    init(text: String, imageName: String) {
        super.init(frame: .zero)

        buttonText.text = text

        iconImage.image = UIImage(systemName: imageName)

        configureButton()
        configureSubviews()
        configureConstraints()

    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    private func configureButton() {
        addSubview(buttonText)
        addSubview(iconImage)
        buttonText.textColor = UIColor(named: ColorName.secondColor.rawValue)
        iconImage.tintColor = UIColor(named: ColorName.secondColor.rawValue)
        buttonText.font = UIFont(name: TextFont.Nunito.semiBold.rawValue, size: 16)
    }

    private func configureSubviews() {
        buttonText.textAlignment = .right
        iconImage.contentMode = .scaleAspectFit
    }

    private func configureConstraints() {
        buttonText.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalTo(iconImage.snp.leading)
            make.top.bottom.equalToSuperview()
        }

        iconImage.snp.makeConstraints { make in
            make.trailing.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.height.equalTo(20)
        }
    }
}
