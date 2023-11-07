//
//
// NewsApp
// FreshNewsCollectionViewCell.swift
//
// Created by Alexander Kist on 17.10.2023.
//

import UIKit
import SnapKit

final class FreshNewsCollectionViewCell: UICollectionViewCell {

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.backgroundColor = .lightGray.withAlphaComponent(0.4)
        label.numberOfLines = 0
        label.font = UIFont(name: TextFont.NewYork.bold.rawValue, size: 20)
        return label
    }()

    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.backgroundColor = .lightGray.withAlphaComponent(0.4)
        label.numberOfLines = 3
        label.text = "“I’m going to say this very bluntly again,” he added. “Buy them only if you’re prepared to lose all your money.”"
        label.font = UIFont(name: TextFont.Nunito.regular.rawValue, size: 14)
        return label
    }()


    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = bounds.height / 12
        layer.masksToBounds = true
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        backgroundImageView.image = nil
        titleLabel.text = nil
        descriptionLabel.text = nil
    }

    private func setupViews() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(backgroundImageView)
        contentView.sendSubviewToBack(backgroundImageView)

        backgroundImageView.alpha = 0.9

        backgroundImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        titleLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.centerY.equalToSuperview()
        }
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.leading.trailing.equalTo(titleLabel)
            make.bottom.equalToSuperview()
        }
    }

    func configure(with viewModel: NewsCollectionViewCellViewModel) {
        titleLabel.text = viewModel.title
        descriptionLabel.text = viewModel.description
        viewModel.fetchImage { [weak self] result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    let image = UIImage(data: data)
                    self?.backgroundImageView.image = image
                }
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
}
