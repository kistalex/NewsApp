//
//
// NewsApp
// TopArticlesCellViewModel.swift
//
// Created by Alexander Kist on 05.11.2023.
//

import UIKit

protocol TopArticlesCellViewModelDelegate: AnyObject {
    func didTopNewsFetched()
    func didSelectArticle(_ article: Article)
}

final class TopArticlesCellViewModel: NSObject {

    weak var delegate: TopArticlesCellViewModelDelegate?

    private var topNews: [Article] = [] {
        didSet {
            newsCellViewModels = topNews.map { article in
                return TopArticlesCollectionViewCellViewModel(
                    title: article.title,
                    description: article.description,
                    urlToImage: URL(string: article.urlToImage ?? "")
                )
            }

            if newsCellViewModels.count >= 5 {
                firstFiveViewModels = Array(newsCellViewModels.prefix(5))
            } else {
                firstFiveViewModels = newsCellViewModels
            }
        }
    }

    private var newsCellViewModels: [TopArticlesCollectionViewCellViewModel] = []
    private var firstFiveViewModels: [TopArticlesCollectionViewCellViewModel] = []

    func fetchTopNews() {
        NewsService.shared.execute(
            .listTopNewsRequest,
            expecting: News.self) { [weak self] result in
                switch result {
                case .success(let newsModel):
                    let result = newsModel.articles
                    self?.topNews = result
                    DispatchQueue.main.async {
                        self?.delegate?.didTopNewsFetched()
                    }
                case .failure(let error):
                    print(String(describing: error))
                }
            }
    }
}

// MARK: - UICollectionViewDataSource
extension TopArticlesCellViewModel: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return firstFiveViewModels.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(TopArticleCollectionViewCell.self)", for: indexPath) as? TopArticleCollectionViewCell else {
            return UICollectionViewCell()
        }

        cell.configure(with: firstFiveViewModels[indexPath.row])
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension TopArticlesCellViewModel: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = collectionView.frame.size
        return CGSize(width: size.width - 50 , height: size.height)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
    }
}
// MARK: - UICollectionViewDelegate
extension TopArticlesCellViewModel: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        let article = topNews[indexPath.row]
        delegate?.didSelectArticle(article)
    }
}