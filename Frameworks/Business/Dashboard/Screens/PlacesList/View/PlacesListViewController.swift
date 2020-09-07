//
//  PlacesListViewController.swift
//  Dashboard
//
//  Created by Daniel Sumara on 07/09/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Foundation
import UIKit
import Utilities

final class PlacesListViewController: UITableViewController {
    
    // MARK: - Properties
    
    private let listAdapter = ListAdapter()
    private let doneButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: nil, action: nil)
    
    private let viewModel: PlacesListViewModel
    
    // MARK: - Initializers
    
    init(viewModel: PlacesListViewModel) {
        self.viewModel = viewModel
        super.init(style: .plain)
    }
    
    required init?(coder: NSCoder) { nil }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupComponents()
        bindViewModelWithView()
        bindViewWithViewModel()
    }
    
    // MARK: - Methods
    
    private func bindViewModelWithView() {
        listAdapter.set(places: viewModel.places)
    }
    
    private func bindViewWithViewModel() {
        listAdapter.placeSelected.observe(on: self) { [viewModel] _, place in viewModel.pick(place: place) }
    }
    
    private func setupComponents() {
        title = "Pick city"
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "row")
        tableView.dataSource = listAdapter
        tableView.delegate = listAdapter
        
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
