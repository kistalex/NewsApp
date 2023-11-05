//
//
// NewsApp
// CategoryNewsCollectionCell.swift
//
// Created by Alexander Kist on 05.11.2023.
//

import UIKit
import SnapKit

class CategoryNewsCollectionCell: UICollectionViewCell {
    private let titleLabel = UILabel(numberOfLines: 0, textColor: .white, font: UIFont.systemFont(ofSize: 14, weight: .semibold))

    private let authorLabel = UILabel(numberOfLines: 0, textColor: .white, font: UIFont.systemFont(ofSize: 12, weight: .semibold))

    private let dateLabel = UILabel(numberOfLines: 0, textColor: .white, font: UIFont.systemFont(ofSize: 12, weight: .semibold))

    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "flower")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        return stackView
    }()

    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = bounds.height / 6
        layer.masksToBounds = true
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    private func setupViews() {
        contentView.addSubview(backgroundImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(stackView)

        titleLabel.text = "5 things to know about the 'conundrum' of lupus"
        authorLabel.text = "Matt Villano"
        dateLabel.text = "Sunday, 9 May 2021"

        stackView.addArrangedSubview(authorLabel)
        stackView.addArrangedSubview(dateLabel)
        contentView.sendSubviewToBack(backgroundImageView)

        backgroundImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        titleLabel.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview().inset(8)
        }

        stackView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).inset(50)
            make.leading.trailing.bottom.equalToSuperview().inset(8)
        }

        authorLabel.snp.makeConstraints { make in
            make.leading.equalTo(stackView.snp.leading)
        }

        dateLabel.snp.makeConstraints { make in
            make.trailing.equalTo(stackView.snp.trailing)
        }
    }
}
