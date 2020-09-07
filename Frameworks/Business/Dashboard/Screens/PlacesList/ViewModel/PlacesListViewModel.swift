//
//  PlacesListViewModel.swift
//  Dashboard
//
//  Created by Daniel Sumara on 07/09/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Foundation

protocol PlacesListViewModel: AnyObject {
    
    var places: [String] { get }
    
    func pick(place: String)
    
}
