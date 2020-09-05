//
//  WeatherURL.swift
//  RestService
//
//  Created by Daniel Sumara on 05/09/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Foundation

struct WeatherURL {
    
    // MARK: - Properties
    
    let url: URL
    
    // MARK: - Initializers
    
    init?(query: String, language: String, units: String) {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.openweathermap.org"
        components.path = "/data/2.5/weather"
        components.queryItems = [
            URLQueryItem(name: "q", value: query),
            URLQueryItem(name: "appid", value: "b7eb1a20abc4db3acb62dc734cdb9f43"),
            URLQueryItem(name: "lang", value: language),
            URLQueryItem(name: "units", value: units)
        ]
        
        guard let url = components.url else { return nil }
        
        self.url = url
    }
    
    init?(longitude: Double, latitude: Double, language: String, units: String) {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.openweathermap.org"
        components.path = "/data/2.5/weather"
        components.queryItems = [
            URLQueryItem(name: "lat", value: latitude.description),
            URLQueryItem(name: "lon", value: longitude.description),
            URLQueryItem(name: "appid", value: "b7eb1a20abc4db3acb62dc734cdb9f43"),
            URLQueryItem(name: "lang", value: language),
            URLQueryItem(name: "units", value: units)
        ]
        
        guard let url = components.url else { return nil }
        
        self.url = url
    }
    
}
