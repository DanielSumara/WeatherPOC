//
//  SnowDTO.swift
//  RestModels
//
//  Created by Daniel Sumara on 05/09/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Foundation

public struct SnowDTO: Decodable {
    
    // MARK: - Properties
    
    public let oneHour: Double
    public let threeHours: Double?
    
}

extension SnowDTO {
    
    private enum CodingKeys: String, CodingKey {
        
        case oneHour = "1h"
        case threeHours = "3h"
        
    }
    
}
