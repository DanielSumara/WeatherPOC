//
//  PlacesListScreen.swift
//  Dashboard
//
//  Created by Daniel Sumara on 07/09/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Business
import Foundation
import UIKit

final class PlacesListScreen: Screen {
    
    // MARK: - Properties
    
    let events: PlacesListScreenEvents
    let viewController: UIViewController
    
    // MARK: - Initializers
    
    init(placesStore: PlacesStore) {
        let events = DefaultPlacesListEvents()
        let model = DefaultPlacesListModel(placesStore: placesStore)
        let viewModel = DefaultPlacesListViewModel(model: model, events: events)
        
        self.events = events
        viewController = PlacesListViewController(viewModel: viewModel)
    }
    
}
