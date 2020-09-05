//
//  Forecast.swift
//  DomainModels
//
//  Created by Daniel Sumara on 05/09/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Foundation

public struct Forecast {
    
    // MARK: - Properties
    
    public let coordinates: Coordinates
    public let weather: Weather
    public let main: Main
    
    public let wind: Wind?
    public let clouds: Clouds?
    public let rain: Rain?
    public let snow: Snow?
    
    public let name: String
    
    // MARK: - Initializers
    
    public init(coordinates: Coordinates,
                weather: Weather,
                main: Main,
                wind: Wind?,
                clouds: Clouds?,
                rain: Rain?,
                snow: Snow?,
                name: String) {
        self.coordinates = coordinates
        self.weather = weather
        self.main = main
        self.wind = wind
        self.clouds = clouds
        self.rain = rain
        self.snow = snow
        self.name = name
    }
    
}
