//
//  DashboardViewController.swift
//  Dashboard
//
//  Created by Daniel Sumara on 05/09/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Foundation
import UIKit
import WeatherKit

final class DashboardViewController: UIViewController {
    
    // MARK: - Properties
    
    private let contentView = ContentView()
    private let favoritesButton = SelectableImageBarButton()
    private let searchButton = ImageBarButton()
    private let locationButton = ImageBarButton()
    
    private let viewModel: DashboardViewModel
    
    // MARK: - Initializers
    
    init(using viewModel: DashboardViewModel) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) { nil }
    
    // MARK: - Lifecycle
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupComponents()
        
        bindViewModelWithView()
        bindViewWithViewModel()
        
        viewModel.getForecast()
    }
    
    // MARK: - Methods
    
    private func bindViewModelWithView() {
        viewModel.title.observe(on: self) { view, title in view.title = title }
        viewModel.place.observe(on: contentView) { view, place in view.set(place: place) }
        viewModel.content.observe(on: self) { view, content in view.set(content: content) }
        viewModel.isFavorite.observe(on: favoritesButton) { button, isFavorite in button.isSelected = isFavorite }
    }
    
    private func bindViewWithViewModel() {
        favoritesButton.tapped.observe(on: self) { [viewModel] _, _ in viewModel.toggleFavorite() }
        locationButton.tapped.observe(on: self) { [viewModel] _, _ in viewModel.getForecastForUserLocation() }
        searchButton.tapped.observe(on: self) { [viewModel] _, _ in viewModel.startSearch() }
    }
    
    private func setupComponents() {
        favoritesButton.set(image: UIImage(systemName: "suit.heart"))
        favoritesButton.set(selectedImage: UIImage(systemName: "suit.heart.fill"))
        searchButton.set(image: UIImage(systemName: "magnifyingglass"))
        locationButton.set(image: UIImage(systemName: "location"))
    }
    
    // MARK: - Actions
    
    private func set(content: ViewContent) {
        contentView.set(content: content)
        
        switch content {
        case .loading: navigationItem.rightBarButtonItems = nil
        case .weather: navigationItem.rightBarButtonItems = [locationButton, searchButton, favoritesButton]
        }
    }
    
}
