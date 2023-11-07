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

    private let endpoint: HeadlineEndpoint
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
    ///Создание  API url 
    public var url: URL? {
        return URL(string: urlString)
    }
    ///Конструктор запроса
    public init(
        endpoint: HeadlineEndpoint,
        pathComponents: [String] = [],
        queryParameters: [URLQueryItem] = []) {
        self.endpoint = endpoint
        self.pathComponents = pathComponents
        self.queryParameters = queryParameters
    }
}
