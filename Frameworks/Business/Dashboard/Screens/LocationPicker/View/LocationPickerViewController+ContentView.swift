//
//  LocationPickerScreen+ContentView.swift
//  Dashboard
//
//  Created by Daniel Sumara on 05/09/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Foundation
import UIKit
import Utilities
import ViewLayout
import WeatherKit

extension LocationPickerViewController {
    
    final class ContentView: UIView {
        
        // MARK: - Events
        
        private(set) lazy var locationChanged: Observable<String> = locationInput.textChanged
        private(set) lazy var commitTapped: Observable<Void> = commitButton.tapped
        
        // MARK: - Properties
        
        private let locationTitleLabel = BodyLabel()
        private let locationInput = TextInput()
        private let commitButton = PrimaryButton()
        
        // MARK: - Initializers
        
        init() {
            super.init(frame: .zero)
            
            setupComponents()
            setupLayout()
        }
        
        required init?(coder: NSCoder) { nil }
        
        // MARK: - Methods
        
        private func setupComponents() {
            backgroundColor = .systemGray6
            locationTitleLabel.text = "Location name:"
            commitButton.setTitle("Commit", for: .normal)
        }
        
        private func setupLayout() {
            layout.add(subviews: locationTitleLabel, locationInput, commitButton)
            
            locationTitleLabel.layout
                .make(.top, equalTo: self, .top, constant: 150)
                .center(.xAxis, with: self, constant: 0)
                .width(equalTo: self, .width, multiplier: 0.75)
            
            locationInput.layout
                .make(.top, equalTo: locationTitleLabel, .bottom, constant: 16)
                .center(.xAxis, with: self, constant: 0)
                .width(equalTo: self, .width, multiplier: 0.75)
            
            commitButton.layout
                .make(.top, equalTo: locationInput, .bottom, constant: 48)
                .center(.xAxis, with: self, constant: 0)
                .width(equalTo: self, .width, multiplier: 0.75)
        }
        
    }
    
}
