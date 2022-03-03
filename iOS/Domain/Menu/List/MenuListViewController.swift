//
//  MenuViewController.swift
//  MVVM-CR
//
//  Created by Errol Cheong on 2022-03-03.
//

import UIKit
import Combine

class MenuListViewController: UIViewController {
    private let viewModel: MenuListViewModel
    private var subscriptions = [AnyCancellable]()
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(MenuItemCell.self)
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    init(_ viewModel: MenuListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupBindings()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.fetchData()
    }
    private func setupView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    private func setupBindings() {
        viewModel.$data.receive(on: DispatchQueue.main).sink { [weak self] data in
            self?.tableView.reloadData()
        }.store(in: &subscriptions)
    }
}

extension MenuListViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.data.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.data[section].items.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MenuItemCell = tableView.dequeueReusableCell(for: indexPath)
        cell.data = viewModel.data[indexPath.section].items[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

extension MenuListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didSelectMenuItem(at: indexPath)
    }
}
