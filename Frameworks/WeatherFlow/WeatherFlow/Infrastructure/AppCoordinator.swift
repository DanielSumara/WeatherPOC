//
//  AppCoordinator.swift
//  WeatherFlow
//
//  Created by Daniel Sumara on 05/09/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Business
import Dashboard
import RestService
import DataRepository
import Foundation
import UIKit

public final class AppCoordinator {
    
    // MARK: - Static properties
    
    public static let instance = AppCoordinator()
    
    // MARK: - Properties
    
    private var mainFlow: ModuleFlow?
    private var window: UIWindow?
    
    // MARK: - Initializers
    
    init() {}
    
    // MARK: - API
    
    public func start(in window: UIWindow) {
        self.window = window
        
        let presenter = DefaultPresenter()
        window.rootViewController = presenter.viewController
        
        let service = DefaultWeatherService()
        let repository = DefaultWeatherRepository(restService: service)
        
        mainFlow = DashboardFlow(using: presenter, repository)
        mainFlow?.start()
    }
    
}
