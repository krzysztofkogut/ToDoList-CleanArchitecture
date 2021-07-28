//
//  ListDetailsView.swift
//  Krzysztof Kogut
//
//  Created by Krzysztof Kogut on 02/06/2021.
//

import SnapKit
import UIKit

@available(iOS 13.0, *)
class ListDetailsView: UIView {
    private let floatButtonWrapperView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 20
        view.backgroundColor = .systemPurple
        return view
    }()

    private let floatButtonImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.tintColor = .white
        view.image = UIImage(systemName: "plus.circle.fill")
        return view
    }()

    let floatButton = UIButton()
    
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
        addSubview(floatButtonWrapperView)
        floatButtonWrapperView.snp.makeConstraints { maker in
            maker.size.equalTo(40)
            maker.top.equalTo(safeAreaLayoutGuide).offset(20)
            maker.trailing.equalTo(-20)
        }
        floatButtonWrapperView.addSubview(floatButtonImageView)
        floatButtonImageView.snp.makeConstraints { maker in
            maker.edges.equalToSuperview().inset(10)
        }
        floatButtonWrapperView.addSubview(floatButton)
        floatButton.snp.makeConstraints { maker in
            maker.edges.equalToSuperview()
        }
        addSubview(tableView)
        tableView.snp.makeConstraints { maker in
            maker.top.equalTo(floatButtonWrapperView.snp.bottom).offset(100)
            maker.bottom.leading.trailing.equalToSuperview()
        }
    }
    
    func hideFloatButton() {
        floatButtonWrapperView.isHidden = true
        floatButtonImageView.isHidden = true
        floatButton.isHidden = true
    }

    func unhideFloatButton() {
        floatButtonWrapperView.isHidden = false
        floatButtonImageView.isHidden = false
        floatButton.isHidden = false
    }
}
