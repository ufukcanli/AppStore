//
//  SearchResult.swift
//  AppStore
//
//  Created by Ufuk Canlı on 8.01.2021.
//

import Foundation

struct ResultArray: Decodable {
    let resultCount: Int
    let results: [SearchResult]
}

struct SearchResult: Decodable {
    let trackName: String
    let primaryGenreName: String
    var averageUserRating: Float?
}
