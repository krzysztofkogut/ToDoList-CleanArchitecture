//
//  UIControl.swift
//  Krzysztof KogutTests
//
//  Created by Krzysztof Kogut on 05/06/2021.
//

import UIKit
@testable import Krzysztof_Kogut

extension UIControl {
    func tap() {
        sendActions(for: .touchUpInside)
    }
}
