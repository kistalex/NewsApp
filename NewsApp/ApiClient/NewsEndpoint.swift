//
//
// NewsApp
// NewsEndpoint.swift
//
// Created by Alexander Kist on 05.11.2023.
//

import Foundation

@frozen enum NewsEndpoint: String, CaseIterable, Hashable {
    case everything
    case topHeadlines

    var urlString: String {
        switch self {
        case .everything:
            return "everything"
        case .topHeadlines:
            return "top-headlines"
        }
    }
}
