//
//  DefaultWeatherRepository.swift
//  DataRepository
//
//  Created by Daniel Sumara on 05/09/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import DomainModels
import RestService
import RestModels
import Utilities

public final class DefaultWeatherRepository: WeatherRepository {
    
    // MARK: - Properties
    
    private let restService: WeatherService
    private let mapper: TransportToDomainMapper
    
    // MARK: - Initializers
    
    public convenience init(restService: WeatherService) {
        self.init(restService: restService, mapper: DefaultTransportToDomainMapper())
    }
    
    init(restService: WeatherService, mapper: TransportToDomainMapper) {
        self.restService = restService
        self.mapper = mapper
    }
    
    // MARK: - API
    
    public func getForecast(for place: String, then completion: @escaping (Result<Forecast, WeatherRepositoryError>) -> Void) {
        restService.getForecast(for: place) { [mapper] (result) in
            switch result {
            case let .failure(error): completion(.failure(.service(error)))
            case let .success(forecast): completion(.success(mapper.forecast(from: forecast)))
            }
        }
    }
    
    
}
