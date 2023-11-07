//
//
// NewsApp
// News.swift
// 
// Created by Alexander Kist on 05.11.2023.
//

import Foundation

struct News: Codable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}

// MARK: News
 struct Article: Codable {
    let source: Source
    let author: String?
    let title: String
    let description: String?
    let url: String
    let urlToImage: String?
    let publishedAt: Date
    let content: String?
}

// MARK: Source
 struct Source: Codable {
    let id: String?
    let name: String
}
