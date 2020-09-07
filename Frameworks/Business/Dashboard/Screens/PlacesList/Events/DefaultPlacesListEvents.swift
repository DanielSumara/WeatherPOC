//
//  DefaultPlacesListEvents.swift
//  Dashboard
//
//  Created by Daniel Sumara on 07/09/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Foundation
import Utilities

final class DefaultPlacesListEvents: PlacesListEvents, PlacesListScreenEvents {
    
    // MARK: - Observables
    
    let placePicked: Observable<String>
    
    // MARK: - Properties
    
    private let _placePicked = EventEmitter<String>()
    
    // MARK: - Initializers
    
    init() {
        placePicked = _placePicked.asObservable()
    }
    
    // MARK: - API
    
    func pick(place: String) {
        _placePicked.notify(using: place)
    }
    
}
