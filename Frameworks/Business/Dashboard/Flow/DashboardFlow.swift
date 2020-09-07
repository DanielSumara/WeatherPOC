//
//  DashboardFlow.swift
//  Dashboard
//
//  Created by Daniel Sumara on 05/09/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Business
import DataRepository
import Foundation
import UIKit

public final class DashboardFlow: ModuleFlow {
    
    // MARK: - Properties
    
    private let placesStore: PlacesStore = UserDefaultsPlacesStore()
    
    private let presenter: Presenter
    private let repository: WeatherRepository
    
    private lazy var screen = DashboardScreen(repository: repository, placesStore: placesStore)
    
    // MARK: - Initializers
    
    public init(using presenter: Presenter, _ repository: WeatherRepository) {
        self.presenter = presenter
        self.repository = repository
    }
    
    // MARK: - API
    
    public func start() {
        screen.events.errorOccurred.observe(on: self) { flow, error in flow.show(error) }
        screen.events.searchTapped.observe(on: self) { flow, _ in flow.showCityPicker() }
        screen.events.pickCityTapped.observe(on: self) { (flow, _) in flow.showCitiesList() }
        
        presenter.push(screen)
    }
    
    public func stop() {}
    
    // MARK: - Methods
    
    private func showCityPicker() {
        let screen = LocationPickerScreen()
        screen.events.cityPicked.observe(on: self.screen) { screen, city in
            screen.getForecast(for: city)
            screen.viewController.dismiss(animated: true)
        }
        
        let presenter = DefaultPresenter()
        presenter.push(screen)
        
        self.presenter.present(presenter.viewController)
    }
    
    private func showCitiesList() {
        let screen = PlacesListScreen(placesStore: placesStore)
        screen.events.placePicked.observe(on: self.screen) { screen, city in
            screen.getForecast(for: city)
            screen.viewController.dismiss(animated: true)
        }
        
        let presenter = DefaultPresenter()
        presenter.push(screen)
        
        self.presenter.present(presenter.viewController)
    }
    
    private func show(_ error: Error) {
        let alertViewController = UIAlertController(title: "Error occurred", message: error.localizedDescription, preferredStyle: .alert)
        alertViewController.addAction(UIAlertAction(title: "Understand", style: .cancel, handler: nil))
        presenter.present(alertViewController)
    }
    
}
