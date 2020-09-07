//
//  DefaultLocationPickerViewModel.swift
//  Dashboard
//
//  Created by Daniel Sumara on 05/09/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Foundation

final class DefaultLocationPickerViewModel: LocationPickerViewModel {
    
    // MARK: - Properties
    
    private let events: LocationPickerEvents
    
    private var city: String = ""
    
    // MARK: - Initializers
    
    init(events: LocationPickerEvents) {
        self.events = events
    }
    
    // MARK: - API
    
    func update(location: String) {
        city = location
    }
    
    func commit() {
        events.pick(location: city)
    }
    
}
