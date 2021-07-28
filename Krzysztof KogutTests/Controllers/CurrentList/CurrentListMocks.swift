//
//  CurrentListMocks.swift
//  Krzysztof KogutTests
//
//  Created by Krzysztof Kogut on 05/06/2021.
//

import CoreData
import UIKit
@testable import Krzysztof_Kogut

class CurrentListViewModelMock: CurrentListViewModelable {
    private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var fetchListsWasCalled = false
    var addListWasCalled = false
    var deleteListWasCalled = false
    var archiveListWasCalled = false
    var currentLists: [List]?
    
    init(currentLists: [List] = []) {
        self.currentLists = currentLists
    }
    
    func fetchLists() {
        fetchListsWasCalled = true
    }
    
    func addList(name: String) {
        addListWasCalled = true
    }
    
    func deleteList(at index: Int) {
        deleteListWasCalled = true
    }
    
    func archiveList(at index: Int) {
        archiveListWasCalled = true
    }
}

class CurrentListRouterMock: CurrentListRoutable {
    var presentListDetailsWasCalled = false
    
    func presentListDetails(with list: List, from context: UIViewController?) {
        presentListDetailsWasCalled = true
    }
}
