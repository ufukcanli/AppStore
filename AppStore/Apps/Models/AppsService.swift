//
//  AppsService.swift
//  AppStore
//
//  Created by Ufuk Canlı on 12.01.2021.
//

import Foundation

class AppsService {
    
    static let shared = AppsService()
    
    let baseURL = "https://rss.itunes.apple.com/api/v1"
    
    private init() {}
    
    func fetchAppsWeLove(completion: @escaping (Result<AppsGroup, ASError>) -> Void) {
        let urlString = "\(baseURL)/us/ios-apps/new-apps-we-love/all/25/explicit.json"
        fetchAppsGroup(urlString: urlString, completion: completion)
    }
    
    func fetchTopGrossing(completion: @escaping (Result<AppsGroup, ASError>) -> Void) {
        let urlString = "\(baseURL)/us/ios-apps/top-grossing/all/25/explicit.json"
        fetchAppsGroup(urlString: urlString, completion: completion)
    }
    
    func fetchTopFree(completion: @escaping (Result<AppsGroup, ASError>) -> Void) {
        let urlString = "\(baseURL)/us/ios-apps/top-free/all/25/explicit.json"
        fetchAppsGroup(urlString: urlString, completion: completion)
    }
    
    func fetchAppsGroup(urlString: String, completion: @escaping (Result<AppsGroup, ASError>) -> Void) {

        guard let url = URL(string: urlString) else {
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
    
    func fetchAppsSocial(completion: @escaping (Result<[AppsSocial], ASError>) -> Void) {
        let urlString = "https://api.letsbuildthatapp.com/appstore/social"
        
        guard let url = URL(string: urlString) else {
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
                let appsSocial = try decoder.decode([AppsSocial].self, from: data)
                completion(.success(appsSocial))
            } catch {
                completion(.failure(.invalidData))
            }
        }
        
        task.resume()
    }
}
