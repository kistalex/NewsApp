//
//
// NewsApp
// NewsService.swift
//
// Created by Alexander Kist on 05.11.2023.
//

import Foundation

final class NewsService {

    enum NewsServiceError: Error {
        case failedToCreateRequest
        case failedToGetData
    }

    static let shared = NewsService()

    private init() {}

    public func execute<T: Codable>( _ request: NewsRequest, expecting type: T.Type, completion: @escaping (Result<T, Error>) -> Void) {
        guard  let urlRequest = self.request(from: request) else {
            completion(.failure(NewsServiceError.failedToCreateRequest))
            return
        }
        let task = URLSession.shared.dataTask(with: urlRequest) {  data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(error ?? NewsServiceError.failedToGetData))
                return
            }

            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                let result = try decoder.decode(type.self, from: data)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }

    // MARK: - Private
    private func request(from rmRequest: NewsRequest) -> URLRequest? {
        guard let url = rmRequest.url else {
            return nil
        }
        var request = URLRequest(url: url)
        request.httpMethod = rmRequest.httpMethod
        return request
    }
}
