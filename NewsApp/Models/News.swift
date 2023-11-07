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
    let articles: [News]
}

// MARK: News
 struct News: Codable {
    let source: Publishing
    let author: String?
    let title, description: String
    let url: String
    let urlToImage: String?
    let publishedAt: Date
    let content: String?
}

// MARK: Source
 struct Publishing: Codable {
    let id: String?
    let name: String
}
