//
//  DashboardViewModel.swift
//  Dashboard
//
//  Created by Daniel Sumara on 05/09/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Foundation
import Utilities

protocol DashboardViewModel: AnyObject {
    
    // MARK: - Observable
    
    var title: Observable<String> { get }
    var place: Observable<String> { get }
    var content: Observable<ViewContent> { get }
    var isFavorite: Observable<Bool> { get }
    
    // MARK: - API
    
    func getForecast()
    
    func toggleFavorite()
    func getForecastForUserLocation()
    
}
