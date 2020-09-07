//
//  PrimaryButton.swift
//  WeatherKit
//
//  Created by Daniel Sumara on 05/09/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Foundation
import UIKit
import Utilities

public final class PrimaryButton: UIButton {
    
    // MARK: - Events
    
    // MARK: - Events
    
    public let tapped: Observable<Void>
    
    // MARK: - Properties
    
    private let _tapped = EventEmitter<Void>()
    
    // MARK: - Initializers
    
    public init() {
        tapped = _tapped.asObservable()
        
        super.init(frame: .zero)
        
        setTitleColor(.systemBlue, for: .normal)
        addTarget(self, action:  #selector(tapped(_:)), for: .touchUpInside)
    }
    
    public required init?(coder: NSCoder) { nil }
    
    // MARK: - Actions
    
    @objc
    private func tapped(_ sender: PrimaryButton) {
        _tapped.notify(using: ())
    }
    
}
