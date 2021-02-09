//
//  AppsSocial.swift
//  AppStore
//
//  Created by Ufuk Canlı on 9.02.2021.
//

import Foundation

struct AppsSocial: Decodable {
    let id: String
    let name: String
    let imageURL: String
    let tagline: String
    
    enum CodingKeys: String, CodingKey {
        case id, name, tagline
        case imageURL = "imageUrl"
    }
}
