//
//  Separator.swift
//  WeatherKit
//
//  Created by Daniel Sumara on 05/09/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Foundation
import UIKit

public final class Separator: UIView {
    
    // MARK: - Getters
    
    override public var intrinsicContentSize: CGSize { CGSize(width: UIView.noIntrinsicMetric, height: 1) }
    
    // MARK: - Initializers
    
    public init() {
        super.init(frame: .zero)
        
        backgroundColor = .lightGray
    }
    
    public required init?(coder: NSCoder) { nil }
    
}
