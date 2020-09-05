//
//  MainDTO.swift
//  RestModels
//
//  Created by Daniel Sumara on 05/09/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Foundation

public struct MainDTO: Decodable {
    
    // MARK: - Properties
    
    public let temp: Decimal
    public let feelsLike: Decimal
    public let tempMin: Decimal
    public let tempMax: Decimal
    public let pressure: UInt
    public let humidity: UInt
    
}
