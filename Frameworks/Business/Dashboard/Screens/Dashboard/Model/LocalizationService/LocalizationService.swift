//
//  LocalizationService.swift
//  Dashboard
//
//  Created by Daniel Sumara on 05/09/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import CoreLocation
import DomainModels
import Foundation
import Utilities

final class LocalizationService: NSObject, CLLocationManagerDelegate {
    
    // MARK: - Observables
    
    let location: Observable<Coordinates>
    
    // MARK: - Properties
    
    private let manager = CLLocationManager()
    
    private let _location = EventEmitter<Coordinates>()
    
    private var authRequest: ((Bool) -> Void)?
    
    // MARK: - Initializers
    
    override init() {
        location = _location.asObservable()
        
        super.init()
        
        manager.delegate = self // INFO: - Delegate should be separated component
    }
    
    // MARK: - API
    
    func requestLocalization(completion: @escaping (Bool) -> Void) {
        guard CLLocationManager.locationServicesEnabled() else { return completion(false) }
        
        switch CLLocationManager.authorizationStatus() {
        case .authorizedAlways: return completion(true)
        case .authorizedWhenInUse: return completion(true)
        case .denied: return completion(false)
        case .notDetermined:
            authRequest = completion
            manager.requestWhenInUseAuthorization()
        case .restricted: return completion(false)
        @unknown default: return completion(false)
        }
    }
    
    func startObserving() {
        manager.startUpdatingLocation()
    }
    
    func stopObserving() {
        manager.stopUpdatingLocation()
    }
 
    // MARK: - Delegate
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedAlways: authRequest?(true)
        case .authorizedWhenInUse: authRequest?(true)
        case .denied: authRequest?(false)
        case .notDetermined: break
        case .restricted: authRequest?(false)
        @unknown default: authRequest?(false)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let coordinates: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        _location.notify(using: Coordinates(latitude: Double(coordinates.latitude), longitude: Double(coordinates.longitude)))
    }
    
}
