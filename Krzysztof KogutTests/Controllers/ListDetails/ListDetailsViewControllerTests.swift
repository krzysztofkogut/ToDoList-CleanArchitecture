//
//  ListDetailsViewControllerTests.swift
//  Krzysztof KogutTests
//
//  Created by Krzysztof Kogut on 05/06/2021.
//

import XCTest
@testable import Krzysztof_Kogut

class ListDetailsViewControllerTests: XCTestCase {
    func testInitWithCoder() {
        XCTAssertNil(CurrentListViewController(coder: NSKeyedArchiver(requiringSecureCoding: true)))
    }
    
    func testNumberOfRowsInSection() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let product1 = Product(context: context)
        let product2 = Product(context: context)
        product1.name = "product1"
        product2.name = "product2"
        do {
            try context.save()
        }
        catch {
            print(error)
        }
        let view = ListDetailsView()
        let viewModel = ListDetailsViewModelMock(products: [product1, product2])
        let router = ListDetailsRouterMock()
        let controller = ListDetailsViewController(
            view: view,
            viewModel: viewModel,
            router: router
        )
        controller.viewDidLoad()
        XCTAssertEqual(controller.tableView(view.tableView, numberOfRowsInSection: 0), 2)
    }

    func testCellForRowAtIndexPath() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let product1 = Product(context: context)
        let product2 = Product(context: context)
        product1.name = "product1"
        product2.name = "product2"
        do {
            try context.save()
        }
        catch {
            print(error)
        }
        let view = ListDetailsView()
        let viewModel = ListDetailsViewModelMock(products: [product1, product2])
        let router = ListDetailsRouterMock()
        let controller = ListDetailsViewController(
            view: view,
            viewModel: viewModel,
            router: router
        )
        controller.viewDidLoad()
        let cell = controller.tableView(view.tableView, cellForRowAt: IndexPath(row: 0, section: 0))
        XCTAssertTrue(cell is TableViewCell)
    }

    


}

