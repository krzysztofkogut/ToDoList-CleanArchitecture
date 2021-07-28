//
//  TabBarAssembly.swift
//  Krzysztof Kogut
//
//  Created by Krzysztof Kogut on 04/06/2021.
//

import Swinject

@available(iOS 13.0, *)
class TabBarAssembly: Assembly {
    func assemble(container: Container) {
        container.register(TabBarView.self) { _ in
            TabBarView()
        }
        container.register(TabBarController.self) { resolver in
            let view = resolver.resolve(TabBarView.self)!
            let tabbarController = TabBarController(mainview: view)
            var controllers = [UIViewController]()
            
            let currentListController = resolver.resolve(CurrentListViewController.self)!
            let currentListNavigationController = UINavigationController(rootViewController: currentListController)
            currentListNavigationController.setNavigationBarHidden(true, animated: false)
            currentListNavigationController.tabBarItem.image = UIImage(systemName: "list.bullet.rectangle")!
            currentListNavigationController.tabBarItem.title = "Current List"
            controllers.append(currentListNavigationController)

            let archiveListController = resolver.resolve(ArchiveListViewController.self)!
            let archiveListNavigationController = UINavigationController(rootViewController: archiveListController)
            archiveListNavigationController.setNavigationBarHidden(true, animated: false)
            archiveListNavigationController.tabBarItem.image = UIImage(systemName: "archivebox")!
            archiveListNavigationController.tabBarItem.title = "Archive List"
            controllers.append(archiveListNavigationController)

            tabbarController.setViewControllers(controllers, animated: true)
            return tabbarController
        }
    }
}
