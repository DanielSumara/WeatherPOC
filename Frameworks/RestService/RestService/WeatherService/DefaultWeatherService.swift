//
//  DefaultWeatherService.swift
//  RestService
//
//  Created by Daniel Sumara on 05/09/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Foundation
import RestModels
import Utilities

public final class DefaultWeatherService: WeatherService {
    
    // MARK: - Properties
    
    private let locale: Locale
    
    private let networkSession: NetworkSession
    private let decoder: JSONDecoder
    
    private weak var ongoingRequest: NetworkSessionTask?
    
    // MARK: - Initializers
    
    public convenience init() {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        self.init(networkSession: DefaultNetworkSession(using: .shared), decoder: decoder)
    }
    
    init(networkSession: NetworkSession, decoder: JSONDecoder, locale: Locale = .current) {
        self.networkSession = networkSession
        self.decoder = decoder
        self.locale = locale
    }
    
    // MARK: - API
    
    public func getForecast(for place: String, then: @escaping (Result<ForecastDTO, WeatherServiceError>) -> Void) {
        guard let url = WeatherURL(query: place, language: locale.languageCode ?? "PL", units: "metric")?.url else { return then(.failure(.invalidUrl)) }
        invoke(url: url, then: then)
    }
    
    public func getForecast(for longitude: Double, _ latitude: Double, then: @escaping (Result<ForecastDTO, WeatherServiceError>) -> Void) {
        guard let url = WeatherURL(longitude: longitude, latitude: latitude, language: locale.languageCode ?? "PL", units: "metric")?.url else { return then(.failure(.invalidUrl)) }
        invoke(url: url, then: then)
    }
    
    // MARK: - Methods
    
    private func invoke(url: URL, then: @escaping (Result<ForecastDTO, WeatherServiceError>) -> Void) {
        let completion: (Result<ForecastDTO, WeatherServiceError>) -> Void = { result in DispatchQueue.main.async { then(result) } }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        ongoingRequest = networkSession.invoke(request: request) { [decoder] data, response, error in
            if let error = error { return completion(.failure(.service(error))) }
            
            // TODO: - Encapsulate validation (Create specialized component to validate response data)
            
            guard let data = data else { return completion(.failure(.invalidResponse)) }
            guard let response = response as? HTTPURLResponse else { return completion(.failure(.invalidResponse)) }
            
            guard (200 ... 299).contains(response.statusCode) else {
                do {
                    let serviceError = try decoder.decode(ServiceError.self, from: data)
                    return completion(.failure(.service(serviceError)))
                } catch {
                    return completion(.failure(.decoding(error)))
                }
            }
            
            // TODO: - Encapsulate decoding (Create specialized component for decoding response data)
            
            do {
                let results = try decoder.decode(ForecastDTO.self, from: data)
                completion(.success(results))
            } catch {
                return completion(.failure(.decoding(error)))
            }
        }
    }
    
}
