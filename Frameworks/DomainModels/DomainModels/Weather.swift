//
//  Weather.swift
//  DomainModels
//
//  Created by Daniel Sumara on 05/09/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Foundation

public struct Weather {
    
    // MARK: - Properties
    
    public let main: String
    public let description: String
    
    // MARK: - Initializers
    
    public init(main: String, description: String) {
        self.main = main
        self.description = description
    }
    
}
