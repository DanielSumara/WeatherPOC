//
//  Screen.swift
//  Business
//
//  Created by Daniel Sumara on 05/09/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Foundation
import UIKit

public protocol Screen: AnyObject {
    
    // MARK: - Properties
    
    var viewController: UIViewController { get }
    
}
