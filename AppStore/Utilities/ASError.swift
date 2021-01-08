//
//  ASError.swift
//  AppStore
//
//  Created by Ufuk Canlı on 8.01.2021.
//

import Foundation

enum ASError: String, Error {
    case invalidRequest = "This is an invalid request. Please try again."
    case unableToComplete = "Unable complete your request. Please check your internet connection."
    case invalidResponse = "Invalid response from the server. Please try again."
    case invalidData = "The data received from the server was invalid. Please try again."
}
