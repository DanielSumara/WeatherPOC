//
//  DashboardScreen.swift
//  Dashboard
//
//  Created by Daniel Sumara on 05/09/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Business
import DataRepository
import Foundation
import UIKit

final class DashboardScreen: Screen {
    
    // MARK: - Properties
    
    let events: DashboardScreenEvents
    let viewController: UIViewController
    
    private let viewModel: DashboardViewModel
    
    // MARK: - Initializers
    
    init(repository: WeatherRepository, placesStore: PlacesStore) {
        let events = DefaultDashboardEvents()
        let model = DefaultDashboardModel(repository: repository, favoritesStore: placesStore, locale: .current)
        
        viewModel = DefaultDashboardViewModel(model: model, mapper: DomainToInterfaceMapper(), events: events)
        self.events = events
        viewController = DashboardViewController(using: viewModel)
    }
    
    // MARK: - API
    
    func getForecast(for city: String) {
        viewModel.getForecast(for: city)
    }
    
}
