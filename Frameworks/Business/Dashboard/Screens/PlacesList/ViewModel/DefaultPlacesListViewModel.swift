//
//  DefaultPlacesListViewModel.swift
//  Dashboard
//
//  Created by Daniel Sumara on 07/09/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Foundation

final class DefaultPlacesListViewModel: PlacesListViewModel {
    
    // MARK: - Properties
 
    let places: [String]
    
    private let events: PlacesListEvents
    
    // MARK: - Initializers
    
    init(model: PlacesListModel, events: PlacesListEvents) {
        self.events = events
        
        places = model.places
    }
    
    // MARK: - API
    
    func pick(place: String) {
        events.pick(place: place)
    }
    
}
