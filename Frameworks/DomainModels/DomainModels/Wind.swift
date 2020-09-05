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
    
    public let speed: Decimal
    public let deg: Int
    public let gust: String?
    
    // MARK: - Initializers
    
    public init(speed: Decimal, deg: Int, gust: String?) {
        self.speed = speed
        self.deg = deg
        self.gust = gust
    }
    
}
