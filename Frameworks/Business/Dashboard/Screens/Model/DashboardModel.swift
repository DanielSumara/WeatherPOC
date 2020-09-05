//
//  DashboardModel.swift
//  Dashboard
//
//  Created by Daniel Sumara on 05/09/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Foundation

protocol DashboardModel: AnyObject {
        
    // MARK: - Properties
    
    var countryCode: String { get }
    var countryName: String { get }
    
}
