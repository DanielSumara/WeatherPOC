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
    
    private let presenter: Presenter
    private let repository: WeatherRepository
    
    private var childFlow: ModuleFlow? {
        didSet {
            oldValue?.stop()
            childFlow?.start()
        }
    }
    
    // MARK: - Initializers
    
    public init(using presenter: Presenter, _ repository: WeatherRepository) {
        self.presenter = presenter
        self.repository = repository
    }
    
    // MARK: - API
    
    public func start() {
        let screen = DashboardScreen(repository: repository)
        screen.events.errorOccurred.observe(on: self) { flow, error in flow.show(error) }
        screen.events.searchTapped.observe(on: self) { flow, _ in flow.showCityPicker() }
        
        presenter.push(screen)
        
        presenter.observeAppearance(of: screen, on: self) { flow in flow.childFlow = nil }
    }
    
    public func stop() {}
    
    // MARK: - Methods
    
    private func showCityPicker() {}
    
    private func show(_ error: Error) {
        let alertViewController = UIAlertController(title: "Error occurred", message: error.localizedDescription, preferredStyle: .alert)
        alertViewController.addAction(UIAlertAction(title: "Understand", style: .cancel, handler: nil))
        presenter.present(alertViewController)
    }
    
}
