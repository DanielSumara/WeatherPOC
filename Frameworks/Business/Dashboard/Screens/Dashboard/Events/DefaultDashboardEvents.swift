//
//  DefaultDashboardEvents.swift
//  Dashboard
//
//  Created by Daniel Sumara on 05/09/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Foundation
import Utilities

final class DefaultDashboardEvents: DashboardScreenEvents, DashboardEvents {
    
    // MARK: - Observables
    
    let errorOccurred: Observable<Error>
    let searchTapped: Observable<Void>
    let pickCityTapped: Observable<Void>
    
    // MARK: - Properties
    
    private let _errorOccurred = EventEmitter<Error>()
    private let _searchTapped = EventEmitter<Void>()
    private let _pickCityTapped = EventEmitter<Void>()
    
    // MARK: - Initializers
    
    init() {
        errorOccurred = _errorOccurred.asObservable()
        searchTapped = _searchTapped.asObservable()
        pickCityTapped = _pickCityTapped.asObservable()
    }
    
    // MARK: - API
    
    func report(_ error: Error) {
        _errorOccurred.notify(using: error)
    }
    
    func invokeSearch() {
        _searchTapped.notify(using: ())
    }
    
    func pickCity() {
        _pickCityTapped.notify(using: ())
    }
    
}
