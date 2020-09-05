//
//  NavigationControllerDelegate.swift
//  Business
//
//  Created by Daniel Sumara on 05/09/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Foundation
import UIKit

final class NavigationControllerDelegate: NSObject, UINavigationControllerDelegate {
    
    // MARK: - Events
    
    var didShow: ((UIViewController) -> Void)?
    
    // MARK: - API
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        didShow?(viewController)
    }
    
}
