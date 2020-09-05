//
//  System.swift
//  DomainModels
//
//  Created by Daniel Sumara on 05/09/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Foundation

public struct System {
    
    // MARK: - Properties
    
    public let country: String
    public let sunrise: Date
    public let sunset: Date
    
    // MARK: - Initializers
    
    public init(country: String, sunrise: Date, sunset: Date) {
        self.country = country
        self.sunrise = sunrise
        self.sunset = sunset
    }
    
}
