//
//  UserDefaultsPlacesStore.swift
//  Business
//
//  Created by Daniel Sumara on 07/09/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Foundation
import Extensions

public final class UserDefaultsPlacesStore: PlacesStore {
    
    // MARK: - Properties
    
    private let userDefaults: UserDefaults
    
    // MARK: - Initializers
    
    public init(using userDefaults: UserDefaults = .standard) {
        self.userDefaults = userDefaults
    }
    
    // MARK: - API
    
    public func store(place: String) {
        if var places = userDefaults.array(forKey: .placesKey) as? [String] {
            places.append(place)
            userDefaults.set(places, forKey: .placesKey)
        } else {
            userDefaults.set([place], forKey: .placesKey)
        }
    }
    
    public func remove(place: String) {
        var places = getPlaces()
        guard let index = places.firstIndex(of: place) else { return }
        places.remove(at: index)
        userDefaults.set(places, forKey: .placesKey)
    }
    
    public func getPlaces() -> [String] {
        (userDefaults.array(forKey: .placesKey) as? [String]).value(or: [])
    }
    
}

fileprivate extension String {
    
    static let placesKey = "places"
    
}
