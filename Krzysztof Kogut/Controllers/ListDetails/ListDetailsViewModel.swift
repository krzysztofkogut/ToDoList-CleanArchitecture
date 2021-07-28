//
//  ListDetailsViewModel.swift
//  Krzysztof Kogut
//
//  Created by Krzysztof Kogut on 02/06/2021.
//

import CoreData
import UIKit

protocol ListDetailsViewModelable {
    var list: List { get }
    var products: [Product]? { get set }
    func fetchProducts()
    func addProduct(name: String)
    func deleteProduct(at index: Int)
}

@available(iOS 13.0, *)
class ListDetailsViewModel: ListDetailsViewModelable {
    private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let list: List
    var products: [Product]?
    
    // MARK: - Initialization

    init(list: List) {
        self.list = list
    }
    
    // MARK: - ListDetailsViewModelable
    
    func fetchProducts() {
        let request = Product.fetchRequest() as NSFetchRequest<Product>
        let predicate = NSPredicate(format: "list == %@", list)
        let nameSortDescriptor = NSSortDescriptor(key: "name", ascending: true)
        request.predicate = predicate
        request.sortDescriptors = [nameSortDescriptor]
        do {
            self.products = try context.fetch(request)
        }
        catch {
            print(error)
        }
    }
    
    func addProduct(name: String) {
        let product = Product(context: context)
        product.name = name
        product.list = list
        
        do {
            try self.context.save()
        }
        catch {
            print(error)
        }
        
        self.fetchProducts()
    }
    
    func deleteProduct(at index: Int) {
        let list = products![index]
        context.delete(list)
        
        do {
            try self.context.save()
        }
        catch {
            print(error)
        }
        
        self.fetchProducts()
    }
}
