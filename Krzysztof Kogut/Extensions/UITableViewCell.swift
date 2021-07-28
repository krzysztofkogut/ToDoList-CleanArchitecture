//
//  UITableViewCell.swift
//  Krzysztof Kogut
//
//  Created by Krzysztof Kogut on 03/06/2021.
//

import UIKit

extension UITableViewCell {
    static var reuseIdentifier: String {
        String(describing: self)
    }
}
