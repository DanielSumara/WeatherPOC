//
//  ForecastDTO.swift
//  RestModels
//
//  Created by Daniel Sumara on 05/09/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Foundation

public struct ForecastDTO: Decodable {
    
    // MARK: - Properties
    
    public let coordinates: CoordinatesDTO
    public let weather: [WeatherDTO]
    public let main: MainDTO
    
    public let wind: WindDTO?
    public let clouds: CloudsDTO?
    public let rain: RainDTO?
    public let snow: SnowDTO?
    
    public let name: String
    
}

extension ForecastDTO {
    
    private enum CodingKeys: String, CodingKey {
        
        case coordinates = "coord"
        case weather
        case main
        
        case wind
        case clouds
        case rain
        case snow
        
        case name
        
    }
    
}
