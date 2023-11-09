//
//
// NewsApp
// NewsRequest.swift
//
// Created by Alexander Kist on 05.11.2023.
//

import Foundation

final class NewsRequest {
    private struct Constants {
        static let baseUrl = "https://newsapi.org/v2"
    }

    private let endpoint: NewsEndpoint
    private let pathComponents: [String]
    private let queryParameters: [URLQueryItem]

    var urlString: String {
        var string = Constants.baseUrl
        string += "/"
        string += endpoint.urlString

        if !pathComponents.isEmpty {
            pathComponents.forEach({
                string += "\($0)"
            })
        }

        if !queryParameters.isEmpty {
            string += "?"
            let argumentString = queryParameters.compactMap({
                guard let value = $0.value else { return nil }
                return "\($0.name)=\(value)"
            }).joined(separator: "&")

            string += argumentString
        }

        return string
    }

    public let httpMethod = "GET"
    /// Создание  API url
    public var url: URL? {
        return URL(string: urlString)
    }
    /// Конструктор запроса
    public init(
        endpoint: NewsEndpoint,
        pathComponents: [String] = [],
        queryParameters: [URLQueryItem] = []) {
            self.endpoint = endpoint
            self.pathComponents = pathComponents
            self.queryParameters = queryParameters
        }
}

extension NewsRequest {
    static let listNewsRequest = NewsRequest(endpoint: NewsEndpoint.everything, pathComponents: [], queryParameters: [
        URLQueryItem(name: "q", value: "Ukraine"),
        URLQueryItem(name: "apiKey", value: "e90c6e13d6bd429a8128e1ab85cd85ab"),
        URLQueryItem(name: "sortBy", value: "publishedAt"),
        URLQueryItem(name: "pageSize", value: "10")
    ])
    static let listTopNewsRequest = NewsRequest(endpoint: NewsEndpoint.topHeadlines ,queryParameters: [
        URLQueryItem(name: "country", value: "us"),
        URLQueryItem(name: "apiKey", value: "e90c6e13d6bd429a8128e1ab85cd85ab"),
        URLQueryItem(name: "category", value: "health")
    ])
}
