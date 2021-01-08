//
//  SearchService.swift
//  AppStore
//
//  Created by Ufuk Canlı on 8.01.2021.
//

import UIKit

final class SearchService {
    
    static let shared = SearchService()
    
    private let baseURL = "https://itunes.apple.com"
    
    private init() {}
    
    func fetchApps(completion: @escaping (Result<ResultArray, ASError>) -> Void) {
            
        let endpoint = "\(baseURL)/search?term=instagram&entity=software"
        
        guard let url = URL(string: endpoint) else {
            completion(.failure(.invalidRequest))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                completion(.failure(.unableToComplete))
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let searchResult = try decoder.decode(ResultArray.self, from: data)
                completion(.success(searchResult))
            } catch {
                completion(.failure(.invalidData))
            }
        }
        
        task.resume()
    }
    
}
