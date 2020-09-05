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
    
    // MARK: - Initializers
    
    init(repository: WeatherRepository) {
        let events = DefaultDashboardEvents()
        let model = DefaultDashboardModel(repository: repository, locale: .current)
        let viewModel = DefaultDashboardViewModel(model: model, mapper: DomainToInterfaceMapper(), events: events)
        
        self.events = events
        
        viewController = DashboardViewController(using: viewModel)
    }
    
}
