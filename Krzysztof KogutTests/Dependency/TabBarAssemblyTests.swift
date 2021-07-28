//
//  TabBarAssemblyTests.swift
//  Krzysztof KogutTests
//
//  Created by Krzysztof Kogut on 04/06/2021.
//

import XCTest
@testable import Krzysztof_Kogut

class TabBarAssemblyTests: XCTestCase {
    private let assembler = Assembler.shared
    func testTabBarView() {
        XCTAssertNotNil(assembler.resolve(TabBarView.self))
    }

    func testTabBarController() {
        XCTAssertNotNil(assembler.resolve(TabBarController.self))
    }
}
