//
//  Coordinates.swift
//  DomainModels
//
//  Created by Daniel Sumara on 05/09/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Foundation

public struct Coordinates {
    
    // MARK: - Properties
    
    public let latitude: Double
    public let longitude: Double
    
    // MARK: - Initializers
    
    public init(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }
    
}
