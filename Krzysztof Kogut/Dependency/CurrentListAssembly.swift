//
//  CurrentListAssembly.swift
//  Krzysztof Kogut
//
//  Created by Krzysztof Kogut on 04/06/2021.
//

import Swinject

@available(iOS 13.0, *)
class CurrentListAssembly: Assembly {
    func assemble(container: Container) {
        container.register(CurrentListView.self) { _ in
            CurrentListView()
        }
        container.register(CurrentListViewModelable.self) { resolver in
            return CurrentListViewModel()
        }
        container.register(CurrentListRoutable.self) { resolver in
            CurrentListRouter(assembler: resolver.resolve(Assembler.self)!)
        }
        container.register(CurrentListViewController.self) { resolver in
            let view = resolver.resolve(CurrentListView.self)!
            let viewModel = resolver.resolve(CurrentListViewModelable.self)!
            let router = resolver.resolve(CurrentListRoutable.self)!
            return CurrentListViewController(view: view, viewModel: viewModel, router: router)
        }
    }
}
