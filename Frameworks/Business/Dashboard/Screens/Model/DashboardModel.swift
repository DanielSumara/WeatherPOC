//
//  DashboardModel.swift
//  Dashboard
//
//  Created by Daniel Sumara on 05/09/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import DomainModels
import Foundation

protocol DashboardModel: AnyObject {
    
    // MARK: - Properties
    
    var countryCode: String { get }
    var countryName: String { get }
    
    // MARK: - API
    
    func getForecastForUserRegion(completion: @escaping (Result<Forecast, Error>) -> Void)
    func getForecast(for place: String, completion: @escaping (Result<Forecast, Error>) -> Void)
    func getForecast(latitude: Double, longitude: Double, completion: @escaping (Result<Forecast, Error>) -> Void)
    
    func askForLocalization(completion: @escaping (Bool) -> Void)
    func getCoordinates(then: @escaping (Coordinates) -> Void)
    
}
