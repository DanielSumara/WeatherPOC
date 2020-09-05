//
//  Optional+ValueOr+Tests.swift
//  ExtensionsTests
//
//  Created by Daniel Sumara on 05/09/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

@testable import Extensions
import Foundation
import XCTest

final class Optional_Extensions_Tests: XCTestCase {
    
    // MARK: - Tests
    
    func test_ValueOrEmpty() {
        let emptyValue: Int? = nil
        XCTAssertEqual(emptyValue.value(or: 1), 1)
        
        let notEmptyValue: Int? = 1
        XCTAssertEqual(notEmptyValue.value(or: 3), 1)
    }
    
}
