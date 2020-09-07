//
//  LocationPickerViewController.swift
//  Dashboard
//
//  Created by Daniel Sumara on 05/09/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Foundation
import UIKit

final class LocationPickerViewController: UIViewController {
    
    // MARK: - Properties
    
    private let contentView = ContentView()
    private let doneButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: nil, action: nil)
    
    private let viewModel: LocationPickerViewModel
    
    // MARK: - Initializers
    
    init(viewModel: LocationPickerViewModel) {
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
    }
    
    // MARK: - Methods
    
    private func bindViewWithViewModel() {
        contentView.commitTapped.observe(on: self) { [viewModel] _, _ in viewModel.commit() }
        contentView.locationChanged.observe(on: self) { [viewModel] _, city in viewModel.update(location: city) }
    }
    
    private func bindViewModelWithView() {}
    
    private func setupComponents() {
        doneButton.target = self
        doneButton.action = #selector(doneTapped(_:))
        
        navigationItem.rightBarButtonItem = doneButton
    }
    
    // MARK: - Actions
    
    @objc
    private func doneTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
}
