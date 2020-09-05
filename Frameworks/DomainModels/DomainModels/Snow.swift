//
//  Snow.swift
//  DomainModels
//
//  Created by Daniel Sumara on 05/09/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Foundation

public struct Snow {
    
    // MARK: - Properties
    
    public let oneHour: Double
    public let threeHours: Double?
    
    // MARK: - Initializers
    
    public init(oneHour: Double, threeHours: Double?) {
        self.oneHour = oneHour
        self.threeHours = threeHours
    }
    
}
