//
//  ListDetailsRouter.swift
//  Krzysztof Kogut
//
//  Created by Krzysztof Kogut on 02/06/2021.
//

import UIKit

protocol ListDetailsRoutable {}

@available(iOS 13.0, *)
class ListDetailsRouter: ListDetailsRoutable {
    var assembler: Assembler

    // MARK: - Initialization

    init(assembler: Assembler) {
        self.assembler = assembler
    }
}
