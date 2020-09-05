//
//  DashboardScreen.swift
//  Dashboard
//
//  Created by Daniel Sumara on 05/09/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Business
import Foundation
import UIKit

final class DashboardScreen: Screen {
    
    // MARK: - Properties
    
    let viewController: UIViewController
    
    // MARK: - Initializers
    
    init() {
        let model = DefaultDashboardModel(locale: .current)
        let viewModel = DefaultDashboardViewModel(model: model)
        viewController = DashboardViewController(using: viewModel)
    }
    
}
