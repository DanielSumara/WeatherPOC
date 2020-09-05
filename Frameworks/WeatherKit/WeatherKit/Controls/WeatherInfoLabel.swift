//
//  WeatherInfoLabel.swift
//  WeatherKit
//
//  Created by Daniel Sumara on 05/09/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Foundation
import UIKit

public final class WeatherInfoLabel: UIStackView {
    
    // MARK: - Getters
    
    public override var intrinsicContentSize: CGSize {
        if body.intrinsicContentSize == .zero { return .zero }
        return super.intrinsicContentSize
    }
    
    // MARK: - Properties
    
    private let icon = IconView()
    private let title = TitleLabel()
    private let body = BodyLabel()
    private let separator = Separator()
    
    // MARK: - Initializers
    
    public init() {
        let container = UIStackView(arrangedSubviews: [title, body, separator])
        container.axis = .vertical
        container.spacing = 4
        
        super.init(frame: .zero)
        
        icon.setContentCompressionResistancePriority(.fittingSizeLevel, for: .vertical)
        icon.setContentHuggingPriority(.fittingSizeLevel, for: .vertical)
        icon.contentMode = .scaleAspectFit
        icon.widthAnchor.constraint(equalToConstant: 48).isActive = true
        
        addArrangedSubview(icon)
        addArrangedSubview(container)
        
        spacing = 24
        
        isHidden = true
    }
    
    public required init(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - API
    
    public func set(icon: UIImage?) {
        self.icon.image = icon
    }
    
    public func set(title: String) {
        self.title.text = title
    }
    
    public func set(text: String?) {
        body.text = text
        isHidden = text == nil
        invalidateIntrinsicContentSize()
    }
    
}
