//
//  ImageBarButtonItem.swift
//  WeatherKit
//
//  Created by Daniel Sumara on 05/09/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Foundation
import UIKit
import Utilities

public final class ImageBarButton: UIBarButtonItem {
    
    // MARK: - Events
    
    public let tapped: Observable<Void>
    
    // MARK: - Properties
    
    private let _tapped = EventEmitter<Void>()
    
    // MARK: - Initializers
    
    public override init() {
        tapped = _tapped .asObservable()
        
        super.init()
        
        self.image = image
        
        target = self
        action = #selector(tapped(_:))
    }
    
    public required init?(coder: NSCoder) { nil }
    
    // MARK: - Actions
    
    public func set(image: UIImage?) {
        self.image = image
    }
    
    // MARK: - Actions
    
    @objc
    private func tapped(_ sender: ImageBarButton) {
        _tapped.notify(using: ())
    }
    
}
