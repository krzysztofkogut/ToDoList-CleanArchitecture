//
//  ListDetailsAssembly.swift
//  Krzysztof Kogut
//
//  Created by Krzysztof Kogut on 04/06/2021.
//

import Swinject

@available(iOS 13.0, *)
class ListDetailsAssembly: Assembly {
    func assemble(container: Container) {
        container.register(ListDetailsView.self) { _ in
            ListDetailsView()
        }
        container.register(ListDetailsViewModelable.self) { (resolver, list: List) in
            return ListDetailsViewModel(list: list)
        }
        container.register(ListDetailsRoutable.self) { resolver in
            ListDetailsRouter(assembler: resolver.resolve(Assembler.self)!)
        }
        container.register(ListDetailsViewController.self) { (resolver, list: List) in
            let view = resolver.resolve(ListDetailsView.self)!
            let viewModel = resolver.resolve(ListDetailsViewModelable.self, argument: list)!
            let router = resolver.resolve(ListDetailsRoutable.self)!
            return ListDetailsViewController(view: view, viewModel: viewModel, router: router)
        }
    }
}
