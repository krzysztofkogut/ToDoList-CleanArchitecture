//
//  UITableView.swift
//  Krzysztof Kogut
//
//  Created by Krzysztof Kogut on 05/06/2021.
//

import UIKit

extension UITableView {
    func dequeueReusableCell<T: UITableViewCell>(for _: T.Type, for indexPath: IndexPath) -> T? {
        dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T
    }
}
