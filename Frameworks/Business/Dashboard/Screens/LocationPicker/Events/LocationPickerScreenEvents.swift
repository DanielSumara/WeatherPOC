//
//  LocationPickerScreenEvents.swift
//  Dashboard
//
//  Created by Daniel Sumara on 05/09/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Foundation
import Utilities

protocol LocationPickerScreenEvents: AnyObject {
    
    // MARK: - Events
    
    var cityPicked: Observable<String> { get }
    
}
