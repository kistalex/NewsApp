//
//
// NewsApp
// CategoryArticlesCollectionViewCellViewModel.swift
// 
// Created by Alexander Kist on 12.11.2023.
//

import Foundation

final class CategoryCollectionViewCellViewModel {

    public let title: String

    public let urlToImage: URL?

    public let author: String?

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

    private var publishedAt: String

    init(title: String, author: String?, urlToImage: URL?, publishedAt: String) {
        self.title = title
        self.author = author
        self.urlToImage = urlToImage
        self.publishedAt = publishedAt
    }

    public func fetchImage(completion: @escaping (Result<Data, Error>) -> Void) {
        guard let url = urlToImage else {
            completion(.failure(URLError(.badURL)))
            return
        }
        ImageLoader.shared.loadImage(url, completion: completion)
    }

}
