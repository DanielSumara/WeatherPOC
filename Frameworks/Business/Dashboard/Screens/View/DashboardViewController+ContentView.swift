//
//  DashboardViewController+ContentView.swift
//  Dashboard
//
//  Created by Daniel Sumara on 05/09/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Foundation
import UIKit
import ViewLayout
import WeatherKit

extension DashboardViewController {
    
    final class ContentView: UIScrollView {
        
        // MARK: - Properties
        
        private let contentView = UIView()
        
        private let activityIndicator = UIActivityIndicatorView(style: .large)
        
        private let locationIcon = IconView()
        private let placeName = TitleLabel()
        private let weatherDescription = BodyLabel()
        
        private let temperatureLabel = WeatherInfoLabel()
        private let feelsLikeTemperatureLabel = WeatherInfoLabel()
        private let pressureLabel = WeatherInfoLabel()
        private let humidity = WeatherInfoLabel()
        private let windSpeedLabel = WeatherInfoLabel()
        private let rainLabel = WeatherInfoLabel()
        private let snowLabel = WeatherInfoLabel()
        
        // MARK: - Initializers
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            
            setupComponents()
            setupLayout()
        }
        
        required init?(coder: NSCoder) { nil }
        
        // MARK: - API
        
        func set(place: String) {
            placeName.text = place
        }
        
        func set(content: ViewContent) {
            switch content {
            case .loading:
                activityIndicator.isHidden = false
                activityIndicator.startAnimating()
                weatherDescription.text = ""
            case let .weather(forecast):
                activityIndicator.stopAnimating()
                activityIndicator.isHidden = true
                bind(with: forecast)
            }
        }
        
        // MARK: - Methods
        
        private func bind(with forecast: ForecastProjection) {
            weatherDescription.text = forecast.description
            temperatureLabel.set(text: forecast.temperature)
            feelsLikeTemperatureLabel.set(text: forecast.feelsLikeTemperature)
            pressureLabel.set(text: forecast.pressure)
            humidity.set(text: forecast.humidity)
            windSpeedLabel.set(text: forecast.windSpeed)
            rainLabel.set(text: forecast.rain)
            snowLabel.set(text: forecast.snow)
        }
        
        private func setupComponents() {
            backgroundColor = .white
            alwaysBounceVertical = true
            
            placeName.numberOfLines = 3
            
            let parameterConfiguration = UIImage.SymbolConfiguration(pointSize: 36, weight: .light)
            
            temperatureLabel.set(title: "Temperature")
            temperatureLabel.set(icon: UIImage(systemName: "thermometer", withConfiguration: parameterConfiguration))
            feelsLikeTemperatureLabel.set(title: "Feels like temperature")
            feelsLikeTemperatureLabel.set(icon: UIImage(systemName: "thermometer.sun", withConfiguration: parameterConfiguration))
            pressureLabel.set(title: "Pressure")
            pressureLabel.set(icon: UIImage(systemName: "rectangle.compress.vertical", withConfiguration: parameterConfiguration))
            humidity.set(title: "Humidity")
            humidity.set(icon: UIImage(systemName: "sun.haze", withConfiguration: parameterConfiguration))
            windSpeedLabel.set(title: "Wind speed")
            windSpeedLabel.set(icon: UIImage(systemName: "wind", withConfiguration: parameterConfiguration))
            rainLabel.set(title: "Rain")
            rainLabel.set(icon: UIImage(systemName: "rain", withConfiguration: parameterConfiguration))
            snowLabel.set(title: "Snow")
            snowLabel.set(icon: UIImage(systemName: "snow", withConfiguration: parameterConfiguration))
            
            let iconConfiguration = UIImage.SymbolConfiguration(pointSize: 40, weight: .light)
            locationIcon.image = UIImage(systemName: "location", withConfiguration: iconConfiguration)
        }
        
        private func setupLayout() {
            contentView.layout
                .add(to: self)
                .embed(in: self)
                .width(equalTo: self, .width)
                .height(greaterThan: self, safeArea: .height)
                .add(subviews: activityIndicator, locationIcon, placeName, weatherDescription)
            
            activityIndicator.layout
                .center(.xAxis, with: contentView, constant: 0)
                .make(.top, equalTo: contentView, .top, constant: 150)
            
            locationIcon.layout
                .make(.top, equalTo: contentView, .top, constant: 0)
                .make(.leading, equalTo: contentView, .leading, constant: 16)
            
            placeName.layout
                .make(.top, equalTo: contentView, .top, constant: 0)
                .make(.leading, equalTo: locationIcon, .trailing, constant: 8)
                .make(.trailing, equalTo: contentView, .trailing, constant: -16)
            
            weatherDescription.layout
                .make(.top, equalTo: placeName, .bottom, constant: 0)
                .make(.leading, equalTo: locationIcon, .trailing, constant: 8)
                .make(.trailing, equalTo: contentView, .trailing, constant: -16)
            
            let container = UIStackView(arrangedSubviews: [
                temperatureLabel,
                feelsLikeTemperatureLabel,
                pressureLabel,
                humidity,
                windSpeedLabel,
                rainLabel,
                snowLabel
            ])
            container.axis = .vertical
            container.spacing = 16
            
            container.layout
                .add(to: contentView)
                .make(.top, equalTo: weatherDescription, .bottom, constant: 32)
                .make(.leading, equalTo: contentView, .leading, constant: 16)
                .make(.trailing, equalTo: contentView, .trailing, constant: -16)
                .make(.bottom, lessThan: contentView, .bottom, constant: -24)
        }
        
    }
    
}
