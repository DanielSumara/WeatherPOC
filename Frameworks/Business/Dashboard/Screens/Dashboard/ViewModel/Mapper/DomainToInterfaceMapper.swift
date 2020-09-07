//
//  DomainToInterfaceMapper.swift
//  Dashboard
//
//  Created by Daniel Sumara on 05/09/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import DomainModels
import Foundation

final class DomainToInterfaceMapper {
    
    // MARK: - Properties
    
    private let unitsFormatter = MeasurementFormatter()
    
    // MARK: - API
    
    func projection(form item: Forecast) -> ForecastProjection {
        ForecastProjection(
            description: item.weather.description,
            temperature: unitsFormatter.string(from: Measurement(value: item.main.temp, unit: UnitTemperature.celsius)),
            feelsLikeTemperature: unitsFormatter.string(from: Measurement(value: item.main.feelsLike, unit: UnitTemperature.celsius)),
            pressure: unitsFormatter.string(from: Measurement(value: Double(item.main.pressure), unit: UnitPressure.hectopascals)),
            humidity: item.main.humidity.description + "%",
            windSpeed: item.wind.flatMap { wind in Measurement(value: wind.speed, unit: UnitSpeed.kilometersPerHour) }.flatMap(unitsFormatter.string(from:)),
            rain: item.rain.flatMap { rain in rain.oneHour.description + "mm" },
            snow: item.snow.flatMap { rain in rain.oneHour.description + "mm" })
    }
    
}
