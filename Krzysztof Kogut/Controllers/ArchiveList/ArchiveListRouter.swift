//
//  ArchiveListRouter.swift
//  Krzysztof Kogut
//
//  Created by Krzysztof Kogut on 02/06/2021.
//

import UIKit

protocol ArchiveListRoutable {
    func presentListDetails(with list: List, from context: UIViewController?)
}

@available(iOS 13.0, *)
class ArchiveListRouter: ArchiveListRoutable {
    var assembler: Assembler

    // MARK: - Initialization

    init(assembler: Assembler) {
        self.assembler = assembler
    }
    
    // MARK: - ArchiveListRoutable

    func presentListDetails(with list: List, from context: UIViewController?) {
        let controller = assembler.resolve(ListDetailsViewController.self, argument: list)!
        context?.navigationController?.pushViewController(controller, animated: true)
    }
}
