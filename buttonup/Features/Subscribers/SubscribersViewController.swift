//
//  SubscribersViewController.swift
//  buttonup
//
//  Created by Russell Blickhan on 3/16/20.
//  Copyright © 2020 Russell Blickhan. All rights reserved.
//

import UIKit

final class SubscribersViewController: UIViewController {
    // MARK: Model

    private let model: SubscribersModel

    // MARK: Subviews

    private let tableView = UITableView(frame: .zero)

    init() {
        model = SubscribersModel()
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidAppear(_: Bool) {
        model.request()
    }
}
