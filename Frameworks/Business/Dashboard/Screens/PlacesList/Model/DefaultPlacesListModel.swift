//
//  DefaultPlacesListModel.swift
//  Dashboard
//
//  Created by Daniel Sumara on 07/09/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Business
import Foundation

final class DefaultPlacesListModel: PlacesListModel {
    
    // MARK: - Properties
    
    let places: [String]
    
    // MARK: - Initializers
    
    init(placesStore: PlacesStore) {
        places = placesStore.getPlaces()
    }
    
}
