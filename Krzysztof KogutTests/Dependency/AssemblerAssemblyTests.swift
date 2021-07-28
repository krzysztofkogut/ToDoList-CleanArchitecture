//
//  AssemblerAssemblyTests.swift
//  Krzysztof KogutTests
//
//  Created by Krzysztof Kogut on 04/06/2021.
//

import XCTest
@testable import Krzysztof_Kogut

class AssemblerAssemblyTests: XCTestCase {
    private var assembler = Assembler.shared
    func testAssembler() {
        XCTAssertNotNil(assembler.resolve(Assembler.self))
    }

    func testAssemblerSharedInstance() {
        let first = assembler.resolve(Assembler.self)
        let second = assembler.resolve(Assembler.self)
        let third = assembler.resolve(Assembler.self)
        XCTAssertTrue(first === second)
        XCTAssertTrue(first === third)
        XCTAssertTrue(second === third)
    }
}
