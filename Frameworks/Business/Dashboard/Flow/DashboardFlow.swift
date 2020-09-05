//
//  DashboardFlow.swift
//  Dashboard
//
//  Created by Daniel Sumara on 05/09/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Business
import Foundation
import UIKit

public final class DashboardFlow: ModuleFlow {
    
    // MARK: - Properties
    
    private let presenter: Presenter
    
    private var childFlow: ModuleFlow? {
        didSet {
            oldValue?.stop()
            childFlow?.start()
        }
    }
    
    // MARK: - Initializers
    
    public init(using presenter: Presenter) {
        self.presenter = presenter
    }
    
    // MARK: - API
    
    public func start() {
        let screen = DashboardScreen()
        presenter.push(screen)
        
        presenter.observeAppearance(of: screen, on: self) { flow in flow.childFlow = nil }
    }
    
    public func stop() {}
    
}
