//
//  ArchiveListAssembly.swift
//  Krzysztof Kogut
//
//  Created by Krzysztof Kogut on 04/06/2021.
//

import Swinject

@available(iOS 13.0, *)
class ArchiveListAssembly: Assembly {
    func assemble(container: Container) {
        container.register(ArchiveListView.self) { _ in
            ArchiveListView()
        }
        container.register(ArchiveListViewModelable.self) { resolver in
            return ArchiveListViewModel()
        }
        container.register(ArchiveListRoutable.self) { resolver in
            ArchiveListRouter(assembler: resolver.resolve(Assembler.self)!)
        }
        container.register(ArchiveListViewController.self) { resolver in
            let view = resolver.resolve(ArchiveListView.self)!
            let viewModel = resolver.resolve(ArchiveListViewModelable.self)!
            let router = resolver.resolve(ArchiveListRoutable.self)!
            return ArchiveListViewController(view: view, viewModel: viewModel, router: router)
        }
    }
}
