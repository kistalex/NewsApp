//
//
// NewsApp
// SourceView.swift
//
// Created by Alexander Kist on 07.11.2023.
//

import UIKit

class SourceView: UIVisualEffectView {

    override init(effect: UIVisualEffect?) {
        super.init(effect: effect)
        let effect = UIBlurEffect(style: .light)
        self.effect = effect
        setupSubviews()
    }

    private let publishedAtLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .black
        label.font = UIFont(name: TextFont.Nunito.semiBold.rawValue, size: 14)
        return label
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .black
        label.font = UIFont(name: TextFont.NewYork.bold.rawValue, size: 18)
        return label
    }()

    private let authorLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .black
        label.font = UIFont(name: TextFont.Nunito.semiBold.rawValue, size: 14)
        return label
    }()

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupSubviews()
    }

    override func layoutSubviews() {
        layer.cornerRadius = bounds.height / 12
        layer.masksToBounds = true
    }

    private func setupSubviews() {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .fill
        stackView.spacing = 8

        stackView.addArrangedSubview(publishedAtLabel)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(authorLabel)

        contentView.addSubview(stackView)

        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(8)
        }
    }

    public func configure(_ viewModel: ArticleDetailViewModel) {
        publishedAtLabel.text = viewModel.formattedPublishedAt
        titleLabel.text = viewModel.title
        authorLabel.text = viewModel.author
    }
}
