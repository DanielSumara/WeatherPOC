//
//  Main.swift
//  DomainModels
//
//  Created by Daniel Sumara on 05/09/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Foundation

public struct Main {
    
    // MARK: - Properties
    
    public let temp: Decimal
    public let feelsLike: Decimal
    public let tempMin: Decimal
    public let tempMax: Decimal
    public let pressure: UInt
    public let humidity: UInt
    
    // MARK: - Initializers
    
    public init(temp: Decimal,
                feelsLike: Decimal,
                tempMin: Decimal,
                tempMax: Decimal,
                pressure: UInt,
                humidity: UInt) {
        self.temp = temp
        self.feelsLike = feelsLike
        self.tempMin = tempMin
        self.tempMax = tempMax
        self.pressure = pressure
        self.humidity = humidity
    }
    
}
