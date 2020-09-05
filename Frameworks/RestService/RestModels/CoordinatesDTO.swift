//
//  CoordinatesDTO.swift
//  RestModels
//
//  Created by Daniel Sumara on 05/09/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Foundation

public struct CoordinatesDTO: Decodable {
    
    // MARK: - Properties
    
    public let latitude: Double
    public let longitude: Double
    
}

extension CoordinatesDTO {
    
    private enum CodingKeys: String, CodingKey {
        
        case latitude = "lat"
        case longitude = "lon"
    }
    
}
