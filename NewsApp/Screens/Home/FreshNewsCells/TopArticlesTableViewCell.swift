//
//
// NewsApp
// TopArticlesTableViewCell.swift
//
// Created by Alexander Kist on 17.10.2023.
//

import UIKit

protocol TopArticlesTableViewCellDelegate: AnyObject {
    func topArticlesTableViewCell(
        _ topArticlesTableViewCell: TopArticlesTableViewCell,
        didSelectArticle article: Article
    )
}

final class TopArticlesTableViewCell: UITableViewCell {

    weak var delegate: TopArticlesTableViewCellDelegate?

    private let viewModel = TopArticlesCellViewModel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        viewModel.fetchTopNews()
        setConstraints()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isHidden = true
        collectionView.alpha = 0
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
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
        collectionView.alwaysBounceHorizontal = true
        collectionView.register(TopArticleCollectionViewCell.self, forCellWithReuseIdentifier: "\(TopArticleCollectionViewCell.self)")

    }

    private func setConstraints() {
        collectionView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.bottom.equalToSuperview()/*.inset(10)*/
            make.height.equalTo(240).multipliedBy(0.4)
        }

        spinner.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
    }
}

extension TopArticlesTableViewCell: TopArticlesCellViewModelDelegate {
    func didSelectArticle(_ article: Article) {
        delegate?.topArticlesTableViewCell(self, didSelectArticle: article)
    }

    func didTopNewsFetched() {
        spinner.stopAnimating()
        collectionView.isHidden = false
        collectionView.reloadData()
        UIView.animate(withDuration: 1) {
            self.collectionView.alpha = 1
        }
    }
}
