//
//  DefaultDashboardViewModel.swift
//  Dashboard
//
//  Created by Daniel Sumara on 05/09/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Foundation
import Utilities

final class DefaultDashboardViewModel: DashboardViewModel {
    
    // MARK: - Observable
    
    let title: Observable<String>
    let place: Observable<String>
    let content: Observable<ViewContent>
    
    let isFavorite: Observable<Bool>
    
    // MARK: - Properties
    
    private let _title = ValueEmitter<String>(value: "Getting forecast")
    private let _place = ValueEmitter<String>(value: "")
    private let _content = ValueEmitter<ViewContent>(value: .loading)
    
    private let _isFavorite = ValueEmitter<Bool>(value: false)
    
    private let events: DashboardEvents
    private let mapper: DomainToInterfaceMapper
    private let model: DashboardModel
    
    // MARK: - Initializers
    
    init(model: DashboardModel, mapper: DomainToInterfaceMapper, events: DashboardEvents) {
        self.events = events
        self.mapper = mapper
        self.model = model
        
        title = _title.asObservable()
        place = _place.asObservable()
        content = _content.asObservable()
        isFavorite = _isFavorite.asObservable()
    }
    
    // MARK: - API
    
    func getForecast() {
        _title.notify(using: "Getting forecast")
        _place.notify(using: model.countryName)
        _content.notify(using: .loading)
        
        model.getForecastForUserRegion { [_title, _content, mapper, events] result in
            switch result {
            case let .success(forecast):
                _title.notify(using: "Forecast")
                _content.notify(using: .weather(mapper.projection(form: forecast)))
            case let .failure(error): events.report(error)
            }
        }
    }
    
    func toggleFavorite() {
        switch _isFavorite.value {
        case true: _isFavorite.notify(using: false)
        case false: _isFavorite.notify(using: true)
        }
    }
    
    func getForecastForUserLocation() {
        _title.notify(using: "Getting forecast")
        _place.notify(using: "Yours location")
        _content.notify(using: .loading)
        
        model.askForLocalization { [weak self] isAllowed in
            switch isAllowed {
            case true: self?.getCoordinates()
            case false: self?.getForecast()
            }
        }
    }
    
    func startSearch() {
        events.invokeSearch()
    }
    
    // MARK: - Actions
    
    private func getCoordinates() {
        model.getCoordinates { [weak self] coordinates in
            self?.getForecastFor(longitude: coordinates.longitude, latitude: coordinates.latitude)
        }
    }
    
    private func getForecastFor(longitude: Double, latitude: Double) {
        model.getForecast(latitude: latitude, longitude: longitude) { [_title, _content, _place, mapper, events] result in
            switch result {
            case let .success(forecast):
                _title.notify(using: "Forecast")
                _place.notify(using: forecast.name)
                _content.notify(using: .weather(mapper.projection(form: forecast)))
            case let .failure(error): events.report(error)
            }
        }
    }
    
}
