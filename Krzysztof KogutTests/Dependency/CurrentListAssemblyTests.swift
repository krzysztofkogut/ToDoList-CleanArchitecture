//
//  CurrentListAssemblyTests.swift
//  Krzysztof KogutTests
//
//  Created by Krzysztof Kogut on 04/06/2021.
//

import XCTest
@testable import Krzysztof_Kogut

class CurrentListAssemblyTests: XCTestCase {
    private var assembler = Assembler.shared
    func testCurrentListView() {
        XCTAssertNotNil(assembler.resolve(CurrentListView.self))
    }

    func testCurrentListViewModel() {
        XCTAssertNotNil(assembler.resolve(CurrentListViewModelable.self))
    }

    func testCurrentListRouter() {
        XCTAssertNotNil(assembler.resolve(CurrentListRoutable.self))
    }

    func testCurrentListController() {
        XCTAssertNotNil(assembler.resolve(CurrentListViewController.self))
    }
}
