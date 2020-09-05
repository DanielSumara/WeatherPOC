//
//  SystemDTO.swift
//  RestModels
//
//  Created by Daniel Sumara on 05/09/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Foundation

public struct SystemDTO: Decodable {
    
    // MARK: - Properties
    
    public let country: String
    public let sunrise: Date
    public let sunset: Date
    
}
