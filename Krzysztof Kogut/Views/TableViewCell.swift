//
//  ProductTableViewCell.swift
//  Krzysztof Kogut
//
//  Created by Krzysztof Kogut on 02/06/2021.
//

import SnapKit
import UIKit

class TableViewCell: UITableViewCell {
    private let wrapperView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.backgroundColor = .white
        return view
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.numberOfLines = 0
        return label
    }()

    // MARK: - Initialization

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setupView()
    }

    required init?(coder _: NSCoder) {
        nil
    }

    // MARK: - Private

    private func setupView() {
        contentView.addSubview(wrapperView)
        wrapperView.snp.makeConstraints { maker in
            maker.leading.equalTo(20)
            maker.trailing.equalTo(-20)
            maker.top.equalTo(10)
            maker.bottom.equalTo(-10)
        }
        wrapperView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { maker in
            maker.top.bottom.leading.equalToSuperview()
        }
    }

    // MARK: - Internal

    func configure(with title: String, accessoryType: UITableViewCell.AccessoryType) {
        titleLabel.text = title
        self.accessoryType = accessoryType
    }
}
