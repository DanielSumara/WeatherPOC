//
//  DefaultDashboardModel.swift
//  Dashboard
//
//  Created by Daniel Sumara on 05/09/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

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
    
    // MARK: - Initializers
    
    init(repository: WeatherRepository, locale: Locale) {
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
        localizationService.location.observe(on: self) { model, coordinates in
            then(coordinates)
            model.localizationService.stopObserving()
        }
    }
    
}
