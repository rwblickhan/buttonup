//
//  ArchivesViewController.swift
//  buttonup
//
//  Created by Russell Blickhan on 3/16/20.
//  Copyright © 2020 Russell Blickhan. All rights reserved.
//

import UIKit

struct ArchivesViewModel {
    var emails = [Email]()
    var refreshing: Bool = false
}

final class ArchivesViewController: UIViewController,
    ArchivesModelDelegate,
    UITableViewDelegate {
    private var model: ArchivesModel!

    // MARK: Subviews

    private let tableView = UITableView(frame: .zero)

    // MARK: Table view data source

    private let datasource: UITableViewDiffableDataSource<Int, Email>

    init() {
        datasource = UITableViewDiffableDataSource(tableView: tableView, cellProvider: { tableView, indexPath, email in
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: ArchivesCell.CellIdentifier,
                for: indexPath
            ) as? ArchivesCell else {
                assert(false)
                return UITableViewCell()
            }
            cell.configure(with: email)
            return cell
        })
        super.init(nibName: nil, bundle: nil)
        model = ArchivesModel(apiClient: APIClientImpl.global, delegate: self)
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) is not implemented")
    }

    // MARK: UIViewController

    override func viewDidLoad() {
        view.addSubview(tableView)
        tableView.frame = view.frame
        tableView.refreshControl = UIRefreshControl()
        tableView.refreshControl?.addTarget(self, action: #selector(refresh), for: .valueChanged)
        tableView.register(ArchivesCell.self, forCellReuseIdentifier: ArchivesCell.CellIdentifier)
        tableView.delegate = self

        navigationController?.navigationBar.barStyle = .default
        navigationController?.navigationBar.barTintColor = .systemBackground
    }

    override func viewDidAppear(_ animated: Bool) {
        model.request()
        super.viewDidAppear(animated)
    }

    // MARK: ArchivesModelDelegate

    func configure(with viewModel: ArchivesViewModel) {
        if !viewModel.refreshing {
            tableView.refreshControl?.endRefreshing()
        }

        var snapshot = NSDiffableDataSourceSnapshot<Int, Email>()
        snapshot.appendSections([0])
        snapshot.appendItems(viewModel.emails)
        datasource.apply(snapshot)
    }

    // MARK: Targets

    @objc private func refresh() {
        model.request()
    }
}
