//
//  WeatherService.swift
//  RestService
//
//  Created by Daniel Sumara on 05/09/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Foundation
import RestModels

public protocol WeatherService: AnyObject {
    
    // MARK: - API
    
    func getForecast(for place: String, then completion: @escaping (Result<ForecastDTO, WeatherServiceError>) -> Void)
    
}



