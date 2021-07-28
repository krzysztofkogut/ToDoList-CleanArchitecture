//
//  ArchiveListViewController.swift
//  Krzysztof Kogut
//
//  Created by Krzysztof Kogut on 02/06/2021.
//

import CoreData
import RxSwift
import UIKit

class ArchiveListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    private let mainView: ArchiveListView
    private let viewModel: ArchiveListViewModelable
    private let router: ArchiveListRoutable
    private let disposeBag = DisposeBag()
    
    // MARK: - Initialization

    init(
        view: ArchiveListView,
        viewModel: ArchiveListViewModelable,
        router: ArchiveListRoutable
    ) {
        mainView = view
        self.viewModel = viewModel
        self.router = router
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
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
        viewModel.fetchLists()
        mainView.tableView.reloadData()
    }

    // MARK: - Private

    private func setupView() {
        view = mainView
        mainView.setup()
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
        viewModel.fetchLists()
    }

    // MARK: - UITableViewDataSource

    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        viewModel.archiveLists?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: TableViewCell.self, for: indexPath)!
        cell.configure(with: (viewModel.archiveLists?[indexPath.row].name)!, accessoryType: .disclosureIndicator)
        return cell
    }
    
    func tableView(_: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        true
    }

    // MARK: - UITableViewDelegate

    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") {  (contextualAction, view, boolValue) in
            self.viewModel.deleteList(at: indexPath.row)
            DispatchQueue.main.async {
                self.mainView.tableView.reloadData()
            }
        }
        
        let swipeActions = UISwipeActionsConfiguration(actions: [deleteAction])

        return swipeActions
    }
    
    func tableView(_: UITableView, didSelectRowAt indexPath: IndexPath) {
        router.presentListDetails(with: viewModel.archiveLists![indexPath.row], from: self)
    }
}
