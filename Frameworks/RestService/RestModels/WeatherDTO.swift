//
//  WeatherDTO.swift
//  RestModels
//
//  Created by Daniel Sumara on 05/09/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Foundation

public struct WeatherDTO: Decodable {
    
    // MARK: - Properties
    
    public let main: String
    public let description: String
    
}
