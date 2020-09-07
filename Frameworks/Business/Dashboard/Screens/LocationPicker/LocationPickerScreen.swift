//
//  LocationPickerScreen.swift
//  Dashboard
//
//  Created by Daniel Sumara on 05/09/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Business
import Foundation
import UIKit

final class LocationPickerScreen: Screen {
    
    // MARK: - Properties
    
    let events: LocationPickerScreenEvents
    let viewController: UIViewController
    
    // MARK: - Initializers
    
    init() {
        let events = DefaultLocationPickerEvents()
        let viewModel = DefaultLocationPickerViewModel(events: events)
        
        self.events = events        
        viewController = LocationPickerViewController(viewModel: viewModel)
    }
    
}
