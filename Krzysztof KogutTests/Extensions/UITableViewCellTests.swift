//
//  UITableViewCellTests.swift
//  Krzysztof KogutTests
//
//  Created by Krzysztof Kogut on 04/06/2021.
//

import XCTest
@testable import Krzysztof_Kogut

class UITableViewCellTests: XCTestCase {
    func testReuseIdentifier() {
        XCTAssertEqual(TableViewCell.reuseIdentifier, "TableViewCell")
    }
}
