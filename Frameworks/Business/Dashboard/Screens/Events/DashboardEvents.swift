//
//  DashboardEvents.swift
//  Dashboard
//
//  Created by Daniel Sumara on 05/09/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Foundation

protocol DashboardEvents: AnyObject {
    
    // MARK: - API
    
    func report(_ error: Error)
    func invokeSearch()
    
}
