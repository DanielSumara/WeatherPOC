//
//  DefaultLocationPickerEvents.swift
//  Dashboard
//
//  Created by Daniel Sumara on 05/09/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Foundation
import Utilities

final class DefaultLocationPickerEvents: LocationPickerScreenEvents, LocationPickerEvents {
    
    // MARK: - Observable
    
    let cityPicked: Observable<String>
    
    // MARK: - Properties
    
    private let _cityPicked = EventEmitter<String>()
    
    // MARK: - Initializers
    
    init() {
        cityPicked = _cityPicked.asObservable()
    }
    
    // MARK: - API
    
    func pick(location: String) {
        _cityPicked.notify(using: location)
    }
    
}
