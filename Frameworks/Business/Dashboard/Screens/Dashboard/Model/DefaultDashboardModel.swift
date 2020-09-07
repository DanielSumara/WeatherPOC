//
//  DefaultDashboardModel.swift
//  Dashboard
//
//  Created by Daniel Sumara on 05/09/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Business
import DataRepository
import DomainModels
import Extensions
import Foundation

final class DefaultDashboardModel: DashboardModel {
    
    // MARK: - Properties
    
    let countryCode: String
    let countryName: String
    
    private let localizationService = LocalizationService() // INFO: - This should be injected interface instance
    
    private let repository: WeatherRepository
    private let favoritesStore: PlacesStore
    
    // MARK: - Initializers
    
    init(repository: WeatherRepository, favoritesStore: PlacesStore, locale: Locale) {
        self.favoritesStore = favoritesStore
        self.repository = repository
        
        countryCode = locale.regionCode.value(or: "PL")
        countryName = locale.localizedString(forRegionCode: countryCode).value(or: "Poland")
    }
    
    // MARK: - API
    
    func getForecastForUserRegion(completion: @escaping (Result<Forecast, Error>) -> Void) {
        repository.getForecast(for: "\(countryName),\(countryCode)") { result in
            switch result {
            case let .success(forecast): completion(.success(forecast))
            case let .failure(error): completion(.failure(error))
            }
        }
    }
    
    func getForecast(for place: String, completion: @escaping (Result<Forecast, Error>) -> Void) {
        repository.getForecast(for: place) { result in
            switch result {
            case let .success(forecast): completion(.success(forecast))
            case let .failure(error): completion(.failure(error))
            }
        }
    }
    
    func getForecast(latitude: Double, longitude: Double, completion: @escaping (Result<Forecast, Error>) -> Void) {
        repository.getForecast(latitude: latitude, longitude: longitude) { result in
            switch result {
            case let .success(forecast): completion(.success(forecast))
            case let .failure(error): completion(.failure(error))
            }
        }
    }
    
    func askForLocalization(completion: @escaping (Bool) -> Void) {
        localizationService.requestLocalization(completion: completion)
    }
    
    func getCoordinates(then: @escaping (Coordinates) -> Void) {
        localizationService.startObserving()
        localizationService.location.observe(on: self) { _, coordinates in then(coordinates) }
    }
    
    func favoriteState(for place: String) -> Bool {
        favoritesStore.getPlaces().contains(place)
    }
    
    func favorite(place: String) {
        favoritesStore.store(place: place)
    }
    
    func unfavorite(place: String) {
        favoritesStore.remove(place: place)
    }
    
}
