//
//
// NewsApp
// TopArticlesCollectionViewCellViewModel.swift
//
// Created by Alexander Kist on 05.11.2023.
//

import Foundation

final class TopArticlesCollectionViewCellViewModel {
    public let title: String
    public let description: String?
    public let urlToImage: URL?

    init(title: String, description: String?, urlToImage: URL?) {
        self.title = title
        self.description = description
        self.urlToImage = urlToImage
    }

    public func fetchImage(completion: @escaping (Result<Data, Error>) -> Void) {
        guard let url = urlToImage else {
            completion(.failure(URLError(.badURL)))
            return
        }
        ImageLoader.shared.loadImage(url, completion: completion)
    }
}
