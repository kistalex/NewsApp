//
//
// NewsApp
// NewsDetailViewController.swift
//
// Created by Alexander Kist on 07.11.2023.
//

import UIKit

final class NewsDetailViewController: UIViewController {

    private let viewModel: ArticleDetailViewModel

    init(viewModel: ArticleDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    private let sourceView = SourceView()
    private let backgroundImageView = UIImageView()
    private let contentLabel = UILabel()
    private let contentContainerView = UIView()
    private let scrollView = UIScrollView()
    private let placeholderView = UIView()

    required init?(coder: NSCoder) {
        fatalError("Error")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setConstraints()
        configure()
        view.backgroundColor = .white
    }

    private func setupViews() {
        view.addSubview(backgroundImageView)
        view.addSubview(scrollView)
        view.addSubview(sourceView)
        scrollView.addSubview(placeholderView)
        scrollView.addSubview(contentContainerView)

        contentContainerView.addSubview(contentLabel)

        placeholderView.backgroundColor = .clear

        contentContainerView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        contentContainerView.layer.cornerRadius = 20
        contentLabel.numberOfLines = 0
        contentContainerView.backgroundColor = .white

    }

    private func setConstraints() {
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        backgroundImageView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.3)

        }

        placeholderView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.bottom.equalTo(contentContainerView.snp.top)
            make.height.equalToSuperview().multipliedBy(0.3)
        }

        contentContainerView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.width.equalToSuperview()
        }

        contentLabel.snp.makeConstraints { make in
            make.top.equalTo(sourceView.snp.bottom).offset(10)
            make.leading.trailing.bottom.equalToSuperview().inset(16)
        }

        sourceView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(32)
            make.centerY.equalTo(contentContainerView.snp.top)
        }
    }

    public func configure() {
        sourceView.configure(viewModel)
        contentLabel.text = viewModel.articleContent
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
