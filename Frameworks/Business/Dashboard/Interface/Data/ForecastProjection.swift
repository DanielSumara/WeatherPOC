//
//  ForecastProjection.swift
//  Dashboard
//
//  Created by Daniel Sumara on 05/09/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import DomainModels
import Foundation

struct ForecastProjection {
    
    // MARK: - Properties
    
    let description: String
    
    let temperature: String
    let feelsLikeTemperature: String
    
    let pressure: String
    let humidity: String
    
    let windSpeed: String?
    let rain: String?
    let snow: String?
    
}
