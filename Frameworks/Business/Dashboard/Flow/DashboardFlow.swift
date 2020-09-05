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
        presenter.push(screen)
        
        presenter.observeAppearance(of: screen, on: self) { flow in flow.childFlow = nil }
    }
    
    public func stop() {}
    
}
