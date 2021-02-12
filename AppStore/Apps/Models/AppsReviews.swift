//
//  AppsReviews.swift
//  AppStore
//
//  Created by Ufuk Canlı on 12.02.2021.
//

import Foundation

struct AppsReviews: Decodable {
    let feed: ReviewsFeed
}

struct ReviewsFeed: Decodable {
    let entry: [Entry]
}

struct Entry: Decodable {
    let author: Author
    let title: Label
    let content: Label
    let rating: Label
    
    enum CodingKeys: String, CodingKey {
        case author, title, content
        case rating = "im:rating"
    }
}

struct Author: Decodable {
    let name: Label
}

struct Label: Decodable {
    let label: String
}
