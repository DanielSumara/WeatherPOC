//
//  DashboardViewController+ContentView.swift
//  Dashboard
//
//  Created by Daniel Sumara on 05/09/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Foundation
import UIKit
import WeatherKit
import ViewLayout

extension DashboardViewController {
    
    final class ContentView: UIScrollView {
        
        // MARK: - Properties
        
        private let contentView = UIView()
        
        private let activityIndicator = UIActivityIndicatorView(style: .large)
        private let placeName = TitleLabel()
        
        // MARK: - Initializers
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            
            setupComponents()
            setupLayout()
        }
        
        required init?(coder: NSCoder) { nil }
        
        // MARK: - API
        
        func set(place: String) {
            placeName.text = place
        }
        
        func set(content: ViewContent) {
            switch content {
            case .loading:
                activityIndicator.isHidden = false
                activityIndicator.startAnimating()
            case let .weather(forecast):
                activityIndicator.stopAnimating()
                activityIndicator.isHidden = true
                bind(with: forecast)
            }
        }
        
        // MARK: - Methods
        
        private func bind(with forecast: ForecastProjection) {
            
        }
        
        private func setupComponents() {
            backgroundColor = .white
            alwaysBounceVertical = true
            
            placeName.numberOfLines = 3
        }
        
        private func setupLayout() {
            contentView.layout
                .add(to: self)
                .embed(in: self)
                .width(equalTo: self, .width)
                .height(greaterThan: self, safeArea: .height)
                .add(subviews: activityIndicator, placeName)
            
            activityIndicator.layout
                .center(.xAxis, with: contentView, constant: 0)
                .make(.top, equalTo: contentView, .top, constant: 150)
            
            placeName.layout
                .make(.top, equalTo: contentView, .top, constant: 0)
                .make(.leading, equalTo: contentView, .leading, constant: 20)
                .make(.trailing, equalTo: contentView, .trailing, constant: -20)
        }
        
    }
    
}
