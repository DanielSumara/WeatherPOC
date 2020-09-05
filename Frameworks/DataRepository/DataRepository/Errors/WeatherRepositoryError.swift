//
//  WeatherRepositoryError.swift
//  DataRepository
//
//  Created by Daniel Sumara on 05/09/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Foundation

public enum WeatherRepositoryError: LocalizedError {

    // MARK: - Cases
    
    case service(Error)
    
    // MARK: - Getters
    
    public var errorDescription: String? {
        switch self {
        case let .service(error): return error.localizedDescription
        }
    }

}
