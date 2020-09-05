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
    
    public let oneHour: UInt
    public let threeHours: UInt
    
    // MARK: - Initializers
    
    public init(oneHour: UInt, threeHours: UInt) {
        self.oneHour = oneHour
        self.threeHours = threeHours
    }
    
}
