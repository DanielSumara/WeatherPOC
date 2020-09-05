//
//  WeatherRepository.swift
//  DataRepository
//
//  Created by Daniel Sumara on 05/09/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import DomainModels
import Foundation

public protocol WeatherRepository: AnyObject {

    // MARK: - API

    func getForecast(for place: String, then completion: @escaping (Result<Forecast, WeatherRepositoryError>) -> Void)

}
