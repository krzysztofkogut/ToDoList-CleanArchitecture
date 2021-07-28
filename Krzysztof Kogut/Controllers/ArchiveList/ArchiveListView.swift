//
//  ArchiveListView.swift
//  Krzysztof Kogut
//
//  Created by Krzysztof Kogut on 02/06/2021.
//

import SnapKit
import UIKit

class ArchiveListView: UIView {    
    let tableView: UITableView = {
        let view = UITableView()
        view.rowHeight = UITableView.automaticDimension
        view.estimatedRowHeight = 80
        view.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.reuseIdentifier)
        view.backgroundColor = .white
        view.separatorStyle = .singleLine
        view.isScrollEnabled = true
        return view
    }()

    // MARK: - Internal

    func setup() {
        backgroundColor = .white
        addSubview(tableView)
        tableView.snp.makeConstraints { maker in
            maker.top.equalTo(safeAreaLayoutGuide).offset(160)
            maker.bottom.leading.trailing.equalToSuperview()
        }
    }
}
