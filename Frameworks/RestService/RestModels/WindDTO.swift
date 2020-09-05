//
//  WindDTO.swift
//  RestModels
//
//  Created by Daniel Sumara on 05/09/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Foundation

public struct WindDTO: Decodable {
    
    // MARK: - Properties
    
    public let speed: Decimal
    public let deg: Int
    public let gust: String?
    
}
