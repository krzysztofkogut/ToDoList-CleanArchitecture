//
//  CurrentListViewControllerTest.swift
//  Krzysztof KogutTests
//
//  Created by Krzysztof Kogut on 05/06/2021.
//

import XCTest
@testable import Krzysztof_Kogut

class CurrentListViewControllerTests: XCTestCase {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    func testInitWithCoder() {
        XCTAssertNil(CurrentListViewController(coder: NSKeyedArchiver(requiringSecureCoding: true)))
    }

    func testNumberOfRowsInSection() {
        let list1 = List(context: context)
        let list2 = List(context: context)
        list1.name = "list1"
        list2.name = "list2"
        do {
            try context.save()
        }
        catch {
            print(error)
        }
        let view = CurrentListView()
        let viewModel = CurrentListViewModelMock(currentLists: [list1, list2])
        let router = CurrentListRouterMock()
        let controller = CurrentListViewController(
            view: view,
            viewModel: viewModel,
            router: router
        )
        controller.viewDidLoad()
        XCTAssertEqual(controller.tableView(view.tableView, numberOfRowsInSection: 0), 2)
    }

    func testCellForRowAtIndexPath() {
        let list1 = List(context: context)
        let list2 = List(context: context)
        list1.name = "list1"
        list2.name = "list2"
        do {
            try context.save()
        }
        catch {
            print(error)
        }
        let view = CurrentListView()
        let viewModel = CurrentListViewModelMock(currentLists: [list1, list2])
        let router = CurrentListRouterMock()
        let controller = CurrentListViewController(
            view: view,
            viewModel: viewModel,
            router: router
        )
        controller.viewDidLoad()
        let cell = controller.tableView(view.tableView, cellForRowAt: IndexPath(row: 0, section: 0))
        XCTAssertTrue(cell is TableViewCell)
    }

    func testDidSelectRowAtIndexPath() {
        let list1 = List(context: context)
        let list2 = List(context: context)
        list1.name = "list1"
        list2.name = "list2"
        do {
            try context.save()
        }
        catch {
            print(error)
        }
        let view = CurrentListView()
        let viewModel = CurrentListViewModelMock(currentLists: [list1, list2])
        let router = CurrentListRouterMock()
        let controller = CurrentListViewController(
            view: view,
            viewModel: viewModel,
            router: router
        )
        controller.viewDidLoad()
        XCTAssertFalse(router.presentListDetailsWasCalled)
        controller.tableView(view.tableView, didSelectRowAt: IndexPath(item: 0, section: 0))
        XCTAssertTrue(router.presentListDetailsWasCalled)
    }
}
