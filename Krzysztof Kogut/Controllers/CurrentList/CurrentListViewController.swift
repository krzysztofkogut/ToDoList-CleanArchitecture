//
//  CurrentListViewController.swift
//  Krzysztof Kogut
//
//  Created by Krzysztof Kogut on 02/06/2021.
//

import CoreData
import RxCocoa
import RxSwift
import UIKit

@available(iOS 13.0, *)
class CurrentListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    private let mainView: CurrentListView
    private let viewModel: CurrentListViewModelable
    private let router: CurrentListRoutable
    private let disposeBag = DisposeBag()
    
    // MARK: - Initialization

    init(
        view: CurrentListView,
        viewModel: CurrentListViewModelable,
        router: CurrentListRoutable
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
        setupActions()
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
        viewModel.currentLists?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: TableViewCell.self, for: indexPath)!
        cell.configure(with: (viewModel.currentLists?[indexPath.row].name)!, accessoryType: .disclosureIndicator)
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
        
        let archiveAction = UIContextualAction(style: .normal, title: "Archive") {  (contextualAction, view, boolValue) in
            self.viewModel.archiveList(at: indexPath.row)
            DispatchQueue.main.async {
                self.mainView.tableView.reloadData()
            }
        }
        archiveAction.backgroundColor = .systemPurple
        
        let swipeActions = UISwipeActionsConfiguration(actions: [deleteAction, archiveAction])

        return swipeActions
    }

    func tableView(_: UITableView, didSelectRowAt indexPath: IndexPath) {
        router.presentListDetails(with: viewModel.currentLists![indexPath.row], from: self)
    }
    
    // MARK: - Private

    private func setupActions() {
        mainView.floatButton.rx.tap.bind { [weak self] in
            let alert = UIAlertController(title: "New List",
                                          message: "Add a new list",
                                          preferredStyle: .alert)
            
            let saveAction = UIAlertAction(title: "Save", style: .default) { [unowned self] action in
                guard let textField = alert.textFields?.first, let nameToSave = textField.text else {
                    return
                }
                
                self?.viewModel.addList(name: nameToSave)
                DispatchQueue.main.async {
                    self?.mainView.tableView.reloadData()
                }
            }
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
            
            alert.addTextField()
            alert.addAction(saveAction)
            alert.addAction(cancelAction)
            
            self?.present(alert, animated: true)
        }.disposed(by: disposeBag)
    }
}
