//
//
// NewsApp
// CategoryArticleCellViewModel.swift
// 
// Created by Alexander Kist on 12.11.2023.
//

import Foundation
import UIKit

protocol CategoryArticleCellViewModelDelegate: AnyObject {
    func didArticlesFetched()
    func didSelectArticle(_ article: Article)
}

final class CategoryArticleCellViewModel: NSObject {

    weak var delegate: CategoryArticleCellViewModelDelegate?

    private var articles: [Article] = [] {
        didSet {
            categoryArticleCellViewModels = articles.map { article in
                return CategoryCollectionViewCellViewModel(
                    title: article.title,
                    author: article.author,
                    urlToImage: URL(string: article.urlToImage ?? ""),
                    publishedAt: article.publishedAt.ISO8601Format())
            }
        }
    }

    private var categoryArticleCellViewModels: [CategoryCollectionViewCellViewModel] = []

    func fetchArticles() {
        NewsService.shared.execute(
            NewsRequest(endpoint: NewsEndpoint.topHeadlines ,queryParameters: [
                URLQueryItem(name: "country", value: "us"),
                URLQueryItem(name: "apiKey", value: "e90c6e13d6bd429a8128e1ab85cd85ab"),
                URLQueryItem(name: "category", value: "sports")
            ]),
            expecting: News.self) { [weak self] result in
                switch result {
                case .success(let newsModel):
                    let result = newsModel.articles
                    self?.articles = result
                    DispatchQueue.main.async {
                        self?.delegate?.didArticlesFetched()
                    }
                case .failure(let error):
                    print(String(describing: error))
                }
            }
    }
}

extension CategoryArticleCellViewModel: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryArticleCellViewModels.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(CategoryNewsCollectionViewCell.self)", for: indexPath) as? CategoryNewsCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.configure(with: categoryArticleCellViewModels[indexPath.row])
        return cell
    }
}

extension CategoryArticleCellViewModel: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = collectionView.frame.size
        return CGSize(width: size.width - 30 , height: size.height / 2)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
    }
}

// MARK: - UICollectionViewDelegate
extension CategoryArticleCellViewModel: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        let article = articles[indexPath.row]
        delegate?.didSelectArticle(article)
    }
}
