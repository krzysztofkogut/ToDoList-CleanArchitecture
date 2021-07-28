//
//  ListDetailsMocks.swift
//  Krzysztof KogutTests
//
//  Created by Krzysztof Kogut on 05/06/2021.
//

import CoreData
import UIKit
@testable import Krzysztof_Kogut

class ListDetailsViewModelMock: ListDetailsViewModelable {
    private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var fetchProductsWasCalled = false
    var addProductWasCalled = false
    var deleteProductWasCalled = false
    var list: List {
        let list = List(context: context)
        list.name = "test"
        list.isArchived = false
        return list
    }
    var products: [Product]?

    
    init(products: [Product] = []) {
        self.products = products
    }
    
    func fetchProducts() {
        fetchProductsWasCalled = true
    }
    
    func addProduct(name: String) {
        addProductWasCalled = true
    }
    
    func deleteProduct(at index: Int) {
        deleteProductWasCalled = true
    }
    
}

class ListDetailsRouterMock: ListDetailsRoutable {
    var presentListDetailsWasCalled = false
    
    func presentListDetails(with list: List, from context: UIViewController?) {
        presentListDetailsWasCalled = true
    }
}
