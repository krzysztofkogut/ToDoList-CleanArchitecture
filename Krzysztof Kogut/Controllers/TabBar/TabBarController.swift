//
//  TabBarController.swift
//  Krzysztof Kogut
//
//  Created by Krzysztof Kogut on 02/06/2021.
//

import UIKit

class TabBarController: UITabBarController {
    private let mainview: TabBarView

    // MARK: - Initialization

    init(mainview: TabBarView) {
        self.mainview = mainview
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder _: NSCoder) {
        nil
    }
    
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    // MARK: - Private

    private func setupView() {
        mainview.setup(with: tabBar)
    }
}
