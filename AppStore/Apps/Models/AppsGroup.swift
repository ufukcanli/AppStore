//
//  AppsGroup.swift
//  AppStore
//
//  Created by Ufuk Canlı on 12.01.2021.
//

import Foundation

struct AppsGroup: Decodable {
    let feed: Feed
}

struct Feed: Decodable {
    let title: String
    let results: [FeedResult]
}

struct FeedResult: Decodable {
    let name: String
    let artistName: String
    let artworkUrl100: String
}

