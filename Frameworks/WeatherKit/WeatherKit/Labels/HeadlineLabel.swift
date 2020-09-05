//
//  HeadlineLabel.swift
//  WeatherKit
//
//  Created by Daniel Sumara on 05/09/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Foundation
import UIKit

public final class HeadlineLabel: UILabel {
    
    // MARK: - Initializers
    
    public override init(frame: CGRect) {
        super.init(frame: .zero)
        
        font = .preferredFont(forTextStyle: .headline)
        textColor = .darkGray
        
        numberOfLines = 1
    }
    
    public required init?(coder: NSCoder) { nil }
    
}
