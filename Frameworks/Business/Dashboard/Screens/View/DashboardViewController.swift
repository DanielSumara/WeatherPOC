//
//  DashboardViewController.swift
//  Dashboard
//
//  Created by Daniel Sumara on 05/09/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Foundation
import UIKit

final class DashboardViewController: UIViewController {
    
    // MARK: - Properties
    
    private let contentView = ContentView()
    
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
        
        bindViewModelWithView()
        bindViewWithViewModel()
        
        viewModel.getForecast()
    }
    
    // MARK: - Methods
    
    private func bindViewModelWithView() {
        viewModel.title.observe(on: self) { view, title in view.title = title }
        viewModel.place.observe(on: contentView) { view, place in view.set(place: place) }
        viewModel.content.observe(on: contentView) { view, content in view.set(content: content) }
    }
    
    private func bindViewWithViewModel() {}
    
}
