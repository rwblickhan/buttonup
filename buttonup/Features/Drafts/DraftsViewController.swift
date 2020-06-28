//
//  DraftsViewController.swift
//  buttonup
//
//  Created by Russell Blickhan on 3/16/20.
//  Copyright © 2020 Russell Blickhan. All rights reserved.
//

import UIKit

struct DraftsViewModel {
    var drafts = [Draft]()
    var refreshing: Bool = false
}

final class DraftsViewController: UIViewController,
    DraftsModelDelegate,
    UITableViewDelegate {
    private var model: DraftsModel!

    // MARK: Subviews

    private let tableView = UITableView(frame: .zero)

    // MARK: Table view data source

    private let datasource: UITableViewDiffableDataSource<Int, Draft>

    init() {
        datasource = UITableViewDiffableDataSource(tableView: tableView, cellProvider: { tableView, indexPath, draft in
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: DraftsCell.CellIdentifier,
                for: indexPath
            ) as? DraftsCell else {
                assert(false)
                return UITableViewCell()
            }
            cell.configure(with: draft)
            return cell
        })
        super.init(nibName: nil, bundle: nil)
        model = DraftsModel(apiClient: APIClientImpl.global, delegate: self)
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: UIViewController

    override func viewDidLoad() {
        view.addSubview(tableView)
        tableView.frame = view.frame
        tableView.refreshControl = UIRefreshControl()
        tableView.refreshControl?.addTarget(self, action: #selector(refresh), for: .valueChanged)
        tableView.register(DraftsCell.self, forCellReuseIdentifier: DraftsCell.CellIdentifier)
        tableView.delegate = self

        navigationController?.navigationBar.barStyle = .default
        navigationController?.navigationBar.barTintColor = .systemBackground
    }

    override func viewDidAppear(_ animated: Bool) {
        model.request()
        super.viewDidAppear(animated)
    }

    // MARK: DraftsModelDelegate

    func configure(with viewModel: DraftsViewModel) {
        if !viewModel.refreshing {
            tableView.refreshControl?.endRefreshing()
        }

        var snapshot = NSDiffableDataSourceSnapshot<Int, Draft>()
        snapshot.appendSections([0])
        snapshot.appendItems(viewModel.drafts)
        datasource.apply(snapshot)
    }

    // MARK: Targets

    @objc private func refresh() {
        model.request()
    }
}
