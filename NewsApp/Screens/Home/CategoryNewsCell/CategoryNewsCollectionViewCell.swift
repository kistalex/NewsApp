//
//
// NewsApp
// CategoryNewsCollectionViewCell.swift
//
// Created by Alexander Kist on 05.11.2023.
//

import UIKit
import SnapKit

class CategoryNewsCollectionViewCell: UICollectionViewCell {
    private let titleLabel = UILabel(numberOfLines: 0, textColor: .black, font: UIFont.systemFont(ofSize: 16, weight: .semibold))

    private let authorLabel = UILabel(numberOfLines: 0, textColor: .black, font: UIFont.systemFont(ofSize: 12, weight: .semibold))

    private let dateLabel = UILabel(numberOfLines: 0, textColor: .black, font: UIFont.systemFont(ofSize: 12, weight: .semibold))

    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
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

    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = nil
        authorLabel.text = nil
        dateLabel.text = nil
        backgroundImageView.image = nil
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    private func setupViews() {
        contentView.addSubview(backgroundImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(authorLabel)
        contentView.addSubview(dateLabel)
        contentView.sendSubviewToBack(backgroundImageView)

        backgroundImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        titleLabel.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview().inset(8)
        }

        authorLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(50)
            make.leading.equalTo(contentView.snp.leading).inset(8)
            make.bottom.equalToSuperview().inset(8)
        }

        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(authorLabel.snp.top)
            make.trailing.equalTo(contentView.snp.trailing).inset(8)
            make.bottom.equalToSuperview().inset(8)
        }
    }

    func configure(with viewModel: CategoryCollectionViewCellViewModel) {
        titleLabel.text = viewModel.title
        authorLabel.text = viewModel.author
        dateLabel.text = viewModel.formattedPublishedAt
        viewModel.fetchImage { [weak self] result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    let image = UIImage(data: data)
                    self?.backgroundImageView.image = image
                }
            case .failure:
                DispatchQueue.main.async {
                    self?.backgroundImageView.image = UIImage(named: "noImage")
                }
            }
        }
    }
}
