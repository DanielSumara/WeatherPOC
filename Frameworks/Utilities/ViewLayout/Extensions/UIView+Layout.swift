//
//  UIView+Layout.swift
//  ViewLayout
//
//  Created by Daniel Sumara on 05/09/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    public var layout: ViewLayout { ViewLayout(of: self) }
    
}
