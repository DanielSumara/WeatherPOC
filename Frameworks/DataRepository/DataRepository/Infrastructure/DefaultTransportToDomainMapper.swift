//
//  DefaultTransportToDomainMapper.swift
//  DataRepository
//
//  Created by Daniel Sumara on 05/09/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import DomainModels
import Foundation
import RestModels

final class DefaultTransportToDomainMapper: TransportToDomainMapper {
    
    // MARK: - API
    
    func forecast(from item: ForecastDTO) -> Forecast {
        Forecast(coordinates: coordinates(from: item.coordinates),
                 weather: weather(from: item.weather[0]), // INFO: - This case should be handled in more verbose way
                 main: main(from: item.main),
                 wind: item.wind.flatMap(wind(from:)),
                 clouds: item.clouds.flatMap(clouds(from:)),
                 rain: item.rain.flatMap(rain(from:)),
                 snow: item.snow.flatMap(snow(from:)),
                 name: item.name)
    }
    
    // MARK: - Methods
    
    private func coordinates(from item: CoordinatesDTO) -> Coordinates {
        Coordinates(latitude: item.latitude, longitude: item.longitude)
    }
    
    private func weather(from item: WeatherDTO) -> Weather {
        Weather(main: item.main, description: item.description)
    }
    
    private func main(from item: MainDTO) -> Main {
        Main(temp: item.temp, feelsLike: item.feelsLike, tempMin: item.tempMin, tempMax: item.tempMax, pressure: item.pressure, humidity: item.humidity)
    }
    
    private func wind(from item: WindDTO) -> Wind {
        Wind(speed: item.speed, deg: item.deg)
    }
    
    private func clouds(from item: CloudsDTO) -> Clouds {
        Clouds(all: item.all)
    }
    
    private func rain(from item: RainDTO) -> Rain {
        Rain(oneHour: item.oneHour, threeHours: item.threeHours)
    }
    
    private func snow(from item: SnowDTO) -> Snow {
        Snow(oneHour: item.oneHour, threeHours: item.threeHours)
    }
    
}
