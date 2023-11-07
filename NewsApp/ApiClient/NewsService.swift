//
//
// NewsApp
// NewsService.swift
//
// Created by Alexander Kist on 05.11.2023.
//

import Foundation

final class NewsService {
    static let shared = NewsService()
    
    private init() {}
    
    public func execute<T: Decodable>( _ request: HeadlineRequest, expecting type: T.Type, completion: @escaping (Result<T, Error>) -> Void){
            
        }
    )
    
    //MARK: - Private
    private func request(from headlineRequest
}
