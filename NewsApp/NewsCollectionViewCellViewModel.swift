//
//
// NewsApp
// NewsCollectionViewCellViewModel.swift
//
// Created by Alexander Kist on 05.11.2023.
//

import Foundation

final class NewsCollectionViewCellViewModel {
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
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(URLError(.badServerResponse)))
                return
            }
            completion(.success(data))
        }
        task.resume()
    }
}
