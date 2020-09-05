//
//  SelectableImageBarButtonItem.swift
//  WeatherKit
//
//  Created by Daniel Sumara on 05/09/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Foundation
import UIKit
import Utilities

public final class SelectableImageBarButton: UIBarButtonItem {
    
    // MARK: - Events
    
    public let tapped: Observable<Void>
    
    // MARK: - Properties
    
    public var isSelected: Bool = false { didSet { updateAppearance() } }
    
    private let _tapped = EventEmitter<Void>()
    
    private var defaultImage: UIImage?
    private var selectedImage: UIImage?
    
    // MARK: - Initializers
    
    override public init() {
        tapped = _tapped.asObservable()
        
        super.init()
        
        image = image
        
        target = self
        action = #selector(tapped(_:))
    }
    
    public required init?(coder: NSCoder) { nil }
    
    // MARK: - API
    
    public func set(image: UIImage?) {
        defaultImage = image
        updateAppearance()
    }
    
    public func set(selectedImage: UIImage?) {
        self.selectedImage = selectedImage
        updateAppearance()
    }
    
    // MARK: - Methods
    
    private func updateAppearance() {
        switch isSelected {
        case true: image = selectedImage
        case false: image = defaultImage
        }
    }
    
    // MARK: - Actions
    
    @objc
    private func tapped(_ sender: SelectableImageBarButton) {
        _tapped.notify(using: ())
    }
    
}
