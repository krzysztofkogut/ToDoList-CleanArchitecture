//
//  Assembler.swift
//  Krzysztof Kogut
//
//  Created by Krzysztof Kogut on 04/06/2021.
//

import Swinject

@available(iOS 13.0, *)
class Assembler: NSObject {
    static let shared = Assembler()
    lazy var assembler: Swinject.Assembler = {
        Swinject.Assembler([
            AssemblerAssembly(),
            TabBarAssembly(),
            ArchiveListAssembly(),
            CurrentListAssembly(),
            ListDetailsAssembly()
            ])
    }()
    
    func resolve<Service>(_ serviceType: Service.Type, name: String? = nil) -> Service? {
        assembler.resolver.resolve(serviceType, name: name)
    }

    func resolve<Service, Argument>(_ serviceType: Service.Type, name: String? = nil, argument: Argument) -> Service? {
        assembler.resolver.resolve(serviceType, name: name, argument: argument)
    }

    func resolve<Service, FirstArgument, SecondArgument>(
        _ serviceType: Service.Type,
        arguments firstArgument: FirstArgument,
        _ secondArgument: SecondArgument
    ) -> Service? {
        assembler.resolver.resolve(serviceType, arguments: firstArgument, secondArgument)
    }
}
