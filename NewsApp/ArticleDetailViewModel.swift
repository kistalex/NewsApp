//
//
// NewsApp
// ArticleDetailViewModel.swift
// 
// Created by Alexander Kist on 07.11.2023.
//

import Foundation

final class ArticleDetailViewModel {
    private let article: Article

    init(article: Article) {
        self.article = article
    }

    public var title: String {
        article.title
    }

    public var description: String {
        article.description ?? article.content ?? "No content"
    }

    public var author: String {
        article.author ?? article.source.name
    }

    public var articleContent: String {
        guard let description = article.description, let content = article.content else {
            return ""
        }
        return description + "\n" + content
    }

    private var urlToImage: URL? {
        guard let urlString = article.urlToImage else {
            return nil
        }

        return URL(string: urlString)
    }

    public var formattedPublishedAt: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss Z"
        guard let date = dateFormatter.date(from: publishedAt) else {
            return ""
        }

        let outputDateFormatter = DateFormatter()
        outputDateFormatter.locale = Locale(identifier: "ru_RU")
        outputDateFormatter.dateFormat = "EEEE, dd MMMM yyyy"
        let formattedDate = outputDateFormatter.string(from: date).capitalized

        return formattedDate
    }

    private var publishedAt: String {
        article.publishedAt.description
    }

    public func fetchImage(completion: @escaping (Result<Data, Error>) -> Void) {
        guard let url = urlToImage else {
            completion(.failure(URLError(.badURL)))
            return
        }
        ImageLoader.shared.loadImage(url, completion: completion)
    }
}
