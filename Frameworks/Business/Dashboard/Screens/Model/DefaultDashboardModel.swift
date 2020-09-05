//
//  DefaultDashboardModel.swift
//  Dashboard
//
//  Created by Daniel Sumara on 05/09/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Extensions
import Foundation

final class DefaultDashboardModel: DashboardModel {
    
    // MARK: - Properties
    
    let countryCode: String
    let countryName: String
    
    // MARK: - Initializers
    
    init(locale: Locale) {
        countryCode = locale.regionCode.value(or: "PL")
        countryName = locale.localizedString(forRegionCode: countryCode).value(or: "Poland")
    }
    
}
