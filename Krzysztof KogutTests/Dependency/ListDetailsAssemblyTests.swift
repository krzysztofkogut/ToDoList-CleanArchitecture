//
//  ListDetailsAssembllyTests.swift
//  Krzysztof KogutTests
//
//  Created by Krzysztof Kogut on 04/06/2021.
//

import XCTest
@testable import Krzysztof_Kogut

class ListDetailsAssemblyTests: XCTestCase {
    private var assembler = Assembler.shared
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    func testListDetailsView() {
        XCTAssertNotNil(assembler.resolve(ListDetailsView.self))
    }

    func testListDetailsViewModel() {
        let list = List(context: context)
        do {
            try self.context.save()
        }
        catch {
            print(error)
        }
        XCTAssertNotNil(assembler.resolve(ListDetailsViewModelable.self, argument: list))
    }

    func testListDetailsRouter() {
        XCTAssertNotNil(assembler.resolve(ListDetailsRoutable.self))
    }

    func testListDetailsController() {
        let list = List(context: context)
        do {
            try self.context.save()
        }
        catch {
            print(error)
        }
        XCTAssertNotNil(assembler.resolve(ListDetailsViewController.self, argument: list))
    }
}
