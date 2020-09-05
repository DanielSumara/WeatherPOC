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
    
    // MARK: - Properties
    
    private let _title = ValueEmitter<String>(value: "Getting forecast")
    private let _place = ValueEmitter<String>(value: "")
    private let _content = ValueEmitter<ViewContent>(value: .loading)
    
    private let mapper: DomainToInterfaceMapper
    private let model: DashboardModel
    
    // MARK: - Initializers
    
    init(model: DashboardModel, mapper: DomainToInterfaceMapper) {
        self.mapper = mapper
        self.model = model
        
        title = _title.asObservable()
        place = _place.asObservable()
        content = _content.asObservable()
        
        _place.notify(using: model.countryName)
    }
    
    // MARK: - API
    
    func getForecast() {
        model.getForecastForUserRegion { [_title, _content, mapper] (result) in
            switch result {
            case let .success(forecast):
                _title.notify(using: "Forecast")
                _content.notify(using: .weather(mapper.projection(form: forecast)))
            case let .failure(error): print(error)
            }
        }
    }
    
}
