//
//  AppsService.swift
//  AppStore
//
//  Created by Ufuk Canlı on 12.01.2021.
//

import Foundation

final class AppsService {
    
    static let shared = AppsService()
        
    private init() {}
    
    private enum Endpoints {
        static let baseURL = "https://rss.itunes.apple.com/api/v1"
        
        case getAppsWeLove
        case getTopGrossing
        case getTopFreeApps
        case getAppsSocial
        
        var stringValue: String {
            switch self {
            case .getAppsWeLove: return "\(Endpoints.baseURL)/us/ios-apps/new-apps-we-love/all/25/explicit.json"
            case .getTopGrossing: return "\(Endpoints.baseURL)/us/ios-apps/top-grossing/all/25/explicit.json"
            case .getTopFreeApps: return "\(Endpoints.baseURL)/us/ios-apps/top-free/all/25/explicit.json"
            case .getAppsSocial: return "https://api.letsbuildthatapp.com/appstore/social"
            }
        }
        
        var url: URL {
            return URL(string: stringValue)!
        }
    }
    
    private func taskForGetRequest<T: Decodable>(url: URL, completion: @escaping (Result<T, ASError>) -> Void) {
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
                let responseObject = try decoder.decode(T.self, from: data)
                completion(.success(responseObject))
            } catch {
                completion(.failure(.invalidData))
            }
        }
        task.resume()
    }
    
    func fetchAppsWeLove(completion: @escaping (Result<AppsGroup, ASError>) -> Void) {
        taskForGetRequest(url: Endpoints.getAppsWeLove.url, completion: completion)
    }
    
    func fetchTopGrossing(completion: @escaping (Result<AppsGroup, ASError>) -> Void) {
        taskForGetRequest(url: Endpoints.getTopGrossing.url, completion: completion)
    }
    
    func fetchTopFree(completion: @escaping (Result<AppsGroup, ASError>) -> Void) {
        taskForGetRequest(url: Endpoints.getTopFreeApps.url, completion: completion)
    }
    
    func fetchAppsSocial(completion: @escaping (Result<[AppsSocial], ASError>) -> Void) {
        taskForGetRequest(url: Endpoints.getAppsSocial.url, completion: completion)
    }
}
