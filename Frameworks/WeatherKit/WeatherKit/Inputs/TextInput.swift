//
//  TextInput.swift
//  WeatherKit
//
//  Created by Daniel Sumara on 05/09/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Extensions
import Foundation
import UIKit
import Utilities

public final class TextInput: UITextField {
    
    // MARK: - Events
    
    public let textChanged: Observable<String>
    
    // MARK: - Properties
    
    private let _textChanged = ValueEmitter<String>(value: "")
    
    // MARK: - Initializers
    
    public init() {
        textChanged = _textChanged.asObservable()
        
        super.init(frame: .zero)
        
        borderStyle = .roundedRect
        addTarget(self, action: #selector(textDidChange(_:)), for: .editingChanged)
    }
    
    public required init?(coder: NSCoder) { nil }
    
    // MARK: - Actions
    
    @objc
    private func textDidChange(_ sender: TextInput) {
        _textChanged.notify(using: text.value(or: ""))
    }
    
}
