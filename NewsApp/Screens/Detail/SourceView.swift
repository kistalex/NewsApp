//
//
// NewsApp
// SourceView.swift
// 
// Created by Alexander Kist on 07.11.2023.
//

import UIKit

final class SourceView: UIView {

    private let viewModel: NewsDetailViewModel

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 0
        label.font = UIFont(name: TextFont.NewYork.bold.rawValue, size: 20)
        return label
    }()

    private let dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 0
        label.font = UIFont(name: TextFont.Nunito.semiBold.rawValue, size: 14)
        return label
    }()

    private let authorLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 0
        label.font = UIFont(name: TextFont.Nunito.extraBold.rawValue, size: 14)
        return label
    }()

    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .fill
        stackView.spacing = 8
        return stackView
    }()

    private let blurView: UIVisualEffectView = {
        let view = UIVisualEffectView()
        let effect = UIBlurEffect(style: .extraLight)
        view.layer.cornerRadius = view.frame.height / 4
        view.clipsToBounds = true
        view.effect = effect
        return view
    }()

    private let contentLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .justified
        return label
    }()

    private let backgroundImageView = UIImageView()
    private let contentContainerView = UIView()
    private let scrollView = UIScrollView()

     init(frame: CGRect, viewModel: NewsDetailViewModel) {
        self.viewModel = viewModel
        super.init(frame: frame)
        setupViews()
        setupViews()
        configureViews()
    }

    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }

    override func layoutSubviews() {
        layer.cornerRadius = bounds.height / 4
        layer.masksToBounds = true
    }

    private func setupViews() {
        addSubview(scrollView)
        scrollView.addSubview(contentContainerView)
        contentContainerView.addSubview(backgroundImageView)
        contentContainerView.addSubview(blurView)
        blurView.contentView.addSubview(stackView)
        contentContainerView.addSubview(contentLabel)
        stackView.addArrangedSubview(dateLabel)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(authorLabel)
    }

    private func setConstraints() {
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        contentContainerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
        }
        
        backgroundImageView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.5)
        }
        
        blurView.snp.makeConstraints { make in
            make.centerY.equalTo(backgroundImageView.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(32)
        }
        
        contentLabel.snp.makeConstraints { make in
            make.top.equalTo(blurView.snp.bottom).offset(8)
            make.leading.trailing.bottom.equalToSuperview().inset(15)
        }
        
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    private func configureViews() {
        dateLabel.text = viewModel.date
        titleLabel.text = viewModel.title
        authorLabel.text = viewModel.authorName
        contentLabel.text = viewModel.content
        viewModel.fetchImage { [weak self] result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    let image = UIImage(data: data)
                    self?.backgroundImageView.image = image
                }
            case .failure:
                DispatchQueue.main.async {
                    let image = UIImage(systemName: "questionmark")
                    self?.backgroundImageView.image = image
                }
            }
        }
    }
}
/*
scrollView.snp.makeConstraints { make in
    make.edges.equalToSuperview()
}
contentContainerView.snp.makeConstraints { make in
    make.edges.equalToSuperview()
    make.width.equalToSuperview()
}

backgroundImageView.snp.makeConstraints { make in
    make.top.leading.trailing.equalToSuperview()
    make.height.equalTo(view.snp.height).multipliedBy(0.5)
}

sourceView.snp.makeConstraints { make in
    make.centerY.equalTo(backgroundImageView.snp.bottom).offset(20)
    make.leading.trailing.equalToSuperview().inset(32)
}

contentLabel.snp.makeConstraints { make in
    make.top.equalTo(sourceView.snp.bottom).offset(8)
    make.leading.trailing.bottom.equalToSuperview().inset(15)
}
*/
