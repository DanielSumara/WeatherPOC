//
//  DashboardScreenEvents.swift
//  Dashboard
//
//  Created by Daniel Sumara on 05/09/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Foundation
import Utilities

protocol DashboardScreenEvents: AnyObject {
    
    // MARK: - Observables
    
    var errorOccurred: Observable<Error> { get }
    var searchTapped: Observable<Void> { get }
    
}
