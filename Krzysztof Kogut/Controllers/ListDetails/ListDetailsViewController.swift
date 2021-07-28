//
//  ListDetailsViewController.swift
//  Krzysztof Kogut
//
//  Created by Krzysztof Kogut on 02/06/2021.
//

import CoreData
import RxSwift
import UIKit

@available(iOS 13.0, *)
class ListDetailsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    private let mainView: ListDetailsView
    private let viewModel: ListDetailsViewModelable
    private let router: ListDetailsRoutable
    private let disposeBag = DisposeBag()
    
    // MARK: - Initialization

    init(
        view: ListDetailsView,
        viewModel: ListDetailsViewModelable,
        router: ListDetailsRoutable
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
        navigationController?.isNavigationBarHidden = false
        viewModel.fetchProducts()
        mainView.tableView.reloadData()
    }

    // MARK: - Private

    private func setupView() {
        navigationItem.title = viewModel.list.name
        view = mainView
        mainView.setup()
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
        if viewModel.list.isArchived {
            mainView.hideFloatButton()
        }
    }

    // MARK: - UITableViewDataSource

    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        viewModel.products?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: TableViewCell.self, for: indexPath)!
        cell.configure(with: (viewModel.products?[indexPath.row].name)!, accessoryType: .none)
        return cell
    }
    
    func tableView(_: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        !viewModel.list.isArchived
    }

    // MARK: - UITableViewDelegate

    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") {  (contextualAction, view, boolValue) in
            self.viewModel.deleteProduct(at: indexPath.row)
            DispatchQueue.main.async {
                self.mainView.tableView.reloadData()
            }
        }
        
        let swipeActions = UISwipeActionsConfiguration(actions: [deleteAction])

        return swipeActions
    }
    
    // MARK: - Private

    private func setupActions() {
        mainView.floatButton.rx.tap.bind { [weak self] in
            let alert = UIAlertController(title: "New Product",
                                          message: "Add a new product",
                                          preferredStyle: .alert)
            
            let saveAction = UIAlertAction(title: "Save", style: .default) { [unowned self] action in
                guard let textField = alert.textFields?.first, let nameToSave = textField.text else {
                    return
                }
                
                self?.viewModel.addProduct(name: nameToSave)
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
