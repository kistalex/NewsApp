//
//
// NewsApp
// CategoryArticlesTableCell.swift
//
// Created by Alexander Kist on 22.10.2023.
//

import UIKit

protocol CategoryArticlesTableCellDelegate: AnyObject {
    func categoryArticlesTableViewCell(
        _ categoryArticlesTableViewCell: CategoryArticlesTableCell,
        didSelectArticle article: Article
    )
}

class CategoryArticlesTableCell: UITableViewCell {

    weak var delegate: CategoryArticlesTableCellDelegate?

    private let viewModel = CategoryArticleCellViewModel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        viewModel.fetchArticles()
        setConstraints()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.isHidden = true
        collectionView.alpha = 0
        return collectionView
    }()

    private let spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.hidesWhenStopped = true
        spinner.translatesAutoresizingMaskIntoConstraints = false
        return spinner
    }()

    private func setupViews() {
        contentView.addSubview(collectionView)
        contentView.addSubview(spinner)
        spinner.startAnimating()
        backgroundColor = .white
        collectionView.delegate = viewModel
        collectionView.dataSource = viewModel
        viewModel.delegate = self
        collectionView.alwaysBounceHorizontal = false
        collectionView.register(CategoryNewsCollectionViewCell.self, forCellWithReuseIdentifier: "\(CategoryNewsCollectionViewCell.self)")
    }

    private func setConstraints() {
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.height.equalTo(240).multipliedBy(0.4)
        }

        spinner.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
    }
}

extension CategoryArticlesTableCell: CategoryArticleCellViewModelDelegate {
    func didArticlesFetched() {
        spinner.stopAnimating()
        collectionView.isHidden = false
        collectionView.reloadData()
        UIView.animate(withDuration: 1) {
            self.collectionView.alpha = 1
        }
    }

    func didSelectArticle(_ article: Article) {
        delegate?.categoryArticlesTableViewCell(self, didSelectArticle: article)
    }
}
