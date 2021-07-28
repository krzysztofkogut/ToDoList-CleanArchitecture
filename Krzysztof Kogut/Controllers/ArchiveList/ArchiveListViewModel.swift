//
//  ArchiveListViewModel.swift
//  Krzysztof Kogut
//
//  Created by Krzysztof Kogut on 02/06/2021.
//

import CoreData
import UIKit

protocol ArchiveListViewModelable {
    var archiveLists: [List]? { get set }
    func fetchLists()
    func deleteList(at index: Int)
}

@available(iOS 13.0, *)
class ArchiveListViewModel: ArchiveListViewModelable {
    private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var archiveLists: [List]?
    
    // MARK: - ArchiveListViewModelable
    
    func fetchLists() {
        let request = List.fetchRequest() as NSFetchRequest<List>
        let predicate = NSPredicate(format: "isArchived == true")
        let creationDateSortDescriptor = NSSortDescriptor(key: "creationDate", ascending: true)
        request.predicate = predicate
        request.sortDescriptors = [creationDateSortDescriptor]
        do {
            self.archiveLists = try context.fetch(request)
        }
        catch {
            
        }
    }
    
    func deleteList(at index: Int) {
        let list = archiveLists![index]
        context.delete(list)
        
        do {
            try self.context.save()
        }
        catch {
            
        }
        
        self.fetchLists()
    }
}
