//
//  ArchiveListMock.swift
//  Krzysztof KogutTests
//
//  Created by Krzysztof Kogut on 05/06/2021.
//

import CoreData
import UIKit
@testable import Krzysztof_Kogut

class ArchiveListViewModelMock: ArchiveListViewModelable {
    var fetchListsWasCalled = false
    var deleteListWasCalled = false
    var archiveLists: [List]?
    
    init(archiveLists: [List] = []) {
        self.archiveLists = archiveLists
    }
    
    func fetchLists() {
        fetchListsWasCalled = true
    }
    
    func deleteList(at index: Int) {
        deleteListWasCalled = true
    }
}

class ArchiveListRouterMock: ArchiveListRoutable {
    var presentListDetailsWasCalled = false
    
    func presentListDetails(with list: List, from context: UIViewController?) {
        presentListDetailsWasCalled = true
    }
}
