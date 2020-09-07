//
//  PlacesStore.swift
//  Business
//
//  Created by Daniel Sumara on 07/09/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Foundation

public protocol PlacesStore: AnyObject {
    
    func store(place: String)
    func remove(place: String) 
    
    func getPlaces() -> [String]
    
}
