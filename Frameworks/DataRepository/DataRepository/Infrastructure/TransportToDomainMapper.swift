//
//  TransportToDomainMapper.swift
//  DataRepository
//
//  Created by Daniel Sumara on 05/09/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import DomainModels
import Foundation
import RestModels

protocol TransportToDomainMapper: AnyObject {

    // MARK: - API

    func forecast(from item: ForecastDTO) -> Forecast

}
