//
//  AssemblerAssembly.swift
//  Krzysztof Kogut
//
//  Created by Krzysztof Kogut on 04/06/2021.
//

import Swinject

@available(iOS 13.0, *)
class AssemblerAssembly: Assembly {
    func assemble(container: Container) {
        container.register(Assembler.self) { _ in
            Assembler()
        }.inObjectScope(.container)
    }
}
