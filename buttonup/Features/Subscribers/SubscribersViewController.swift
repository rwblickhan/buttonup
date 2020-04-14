//
//  SubscribersViewController.swift
//  buttonup
//
//  Created by Russell Blickhan on 3/16/20.
//  Copyright © 2020 Russell Blickhan. All rights reserved.
//

import UIKit

final class SubscribersViewController: UIViewController,
SubscribersModelDelegate {
    
    // MARK: Model

    private var model: SubscribersModel!

    // MARK: Subviews

    private let tableView = UITableView(frame: .zero)
    
    // MARK: Table view data source
    let datasource: UITableViewDiffableDataSource<Int, Subscriber>

    init() {
        datasource = UITableViewDiffableDataSource(tableView: tableView, cellProvider: { tableView, indexPath, subscriber in
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: SubscribersCell.CellIdentifier,
                for: indexPath) as? SubscribersCell else {
                    assert(false)
                    return UITableViewCell()
            }
            cell.configure(with: subscriber)
            return cell
        })
        super.init(nibName: nil, bundle: nil)
        model = SubscribersModel(delegate: self)
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
        tableView.register(SubscribersCell.self, forCellReuseIdentifier: SubscribersCell.CellIdentifier)
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        model.request()
        super.viewDidAppear(animated)
    }
    
    // MARK: SubscribersModelDelegate
    
    func subscribersModelDidUpdate(_ subscribers: [Subscriber]) {
        var snapshot = NSDiffableDataSourceSnapshot<Int, Subscriber>()
        snapshot.appendSections([0])
        snapshot.appendItems(subscribers)
        datasource.apply(snapshot)
    }
    
    func subscribersModelDidFinishRefreshing() {
        tableView.refreshControl?.endRefreshing()
    }
    
    // MARK: Targets
    
    @objc private func refresh() {
        model.request()
    }
}
