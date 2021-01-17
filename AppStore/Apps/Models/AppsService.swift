//
//  AppsService.swift
//  AppStore
//
//  Created by Ufuk Canlı on 12.01.2021.
//

import Foundation

class AppsService {
    
    static let shared = AppsService()
    
    let baseURL = "https://rss.itunes.apple.com"
    
    private init() {}
    
    func fetchApps(completion: @escaping (Result<AppsGroup, ASError>) -> Void) {
        
        let endpoint = "\(baseURL)/api/v1/us/ios-apps/new-apps-we-love/all/25/explicit.json"
        
        guard let url = URL(string: endpoint) else {
            completion(.failure(.invalidRequest))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                completion(.failure(.unableToComplete))
                return
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
                let appsGroup = try decoder.decode(AppsGroup.self, from: data)
                completion(.success(appsGroup))
            } catch {
                completion(.failure(.invalidData))
            }
        }
        
        task.resume()
    }
    
}
