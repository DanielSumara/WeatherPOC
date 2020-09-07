//
//  PlacesListViewController+ListAdapter.swift
//  Dashboard
//
//  Created by Daniel Sumara on 07/09/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Foundation
import UIKit
import Utilities

extension PlacesListViewController {
    
    final class ListAdapter: NSObject, UITableViewDataSource, UITableViewDelegate {
        
        // MARK: - Observables
        
        private(set) lazy var placeSelected: Observable<String> = _placeSelected.asObservable()
        
        // MARK: - Properties
        
        private let _placeSelected = EventEmitter<String>()
        
        private var places: [String] = []
        
        // MARK: - API
        
        func set(places: [String]) {
            self.places = places
        }
        
        // MARK: - DataSource
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            places.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "row", for: indexPath)
            cell.textLabel?.text = places[indexPath.row]
            return cell
        }
        
        // MARK: - Delegate
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            _placeSelected.notify(using: places[indexPath.row])
        }
        
    }
    
}
