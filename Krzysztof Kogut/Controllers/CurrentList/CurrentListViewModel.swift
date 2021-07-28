//
//  CurrentListViewModel.swift
//  Krzysztof Kogut
//
//  Created by Krzysztof Kogut on 02/06/2021.
//

import CoreData
import UIKit

protocol CurrentListViewModelable {
    var currentLists: [List]? { get set }
    func fetchLists()
    func addList(name: String)
    func deleteList(at index: Int)
    func archiveList(at index: Int)
}

@available(iOS 13.0, *)
class CurrentListViewModel: CurrentListViewModelable {
    private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var currentLists: [List]?
    
    // MARK: - CurrentListViewModelable
    
    func fetchLists() {
        let request = List.fetchRequest() as NSFetchRequest<List>
        let predicate = NSPredicate(format: "isArchived == false")
        let creationDateSortDescriptor = NSSortDescriptor(key: "creationDate", ascending: true)
        request.predicate = predicate
        request.sortDescriptors = [creationDateSortDescriptor]
        do {
            self.currentLists = try context.fetch(request)
        }
        catch {
            print(error)
        }
    }
    
    func addList(name: String) {
        let list = List(context: context)
        list.isArchived = false
        list.creationDate = Date()
        list.name = name
        
        do {
            try self.context.save()
        }
        catch {
            print(error)
        }
        
        self.fetchLists()
    }
    
    func deleteList(at index: Int) {
        let list = currentLists![index]
        context.delete(list)
        
        do {
            try self.context.save()
        }
        catch {
            print(error)
        }
        
        self.fetchLists()
    }
    
    func archiveList(at index: Int) {
        let list = currentLists?[index]
        list?.isArchived = true
        
        do {
            try self.context.save()
        }
        catch {
            print(error)
        }
        
        self.fetchLists()
    }
}
