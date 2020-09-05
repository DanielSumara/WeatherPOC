//
//  WeatherServiceError.swift
//  RestService
//
//  Created by Daniel Sumara on 05/09/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Foundation

public enum WeatherServiceError: LocalizedError {
    
    // MARK: - Cases
    
    case invalidUrl
    case invalidResponse
    
    case service(Error)
    case decoding(Error)
    
    // MARK: - Getters
    
    public var errorDescription: String? {
        switch self {
        case .invalidUrl: return "Invalid url"
        case .invalidResponse: return "Invalid response"
        case let .service(error): return error.localizedDescription
        case let .decoding(error): return error.localizedDescription
        }
    }
    
}
