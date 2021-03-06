//
//  Wind.swift
//  DomainModels
//
//  Created by Daniel Sumara on 05/09/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Foundation

public struct Wind {
    
    // MARK: - Properties
    
    public let speed: Double
    public let deg: Int
    
    // MARK: - Initializers
    
    public init(speed: Double, deg: Int) {
        self.speed = speed
        self.deg = deg
    }
    
}
