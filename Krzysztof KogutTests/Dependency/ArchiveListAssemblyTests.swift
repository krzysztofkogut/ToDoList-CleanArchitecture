//
//  ArchiveListAssemblyTests.swift
//  Krzysztof KogutTests
//
//  Created by Krzysztof Kogut on 04/06/2021.
//

import XCTest
@testable import Krzysztof_Kogut

class ArchiveListAssemblyTests: XCTestCase {
    private var assembler = Assembler.shared
    func testArchiveListView() {
        XCTAssertNotNil(assembler.resolve(ArchiveListView.self))
    }

    func testArchiveListViewModel() {
        XCTAssertNotNil(assembler.resolve(ArchiveListViewModelable.self))
    }

    func testArchiveListRouter() {
        XCTAssertNotNil(assembler.resolve(ArchiveListRoutable.self))
    }

    func testArchiveListController() {
        XCTAssertNotNil(assembler.resolve(ArchiveListViewController.self))
    }
}
