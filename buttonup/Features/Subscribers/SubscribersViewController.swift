//
//  SubscribersViewController.swift
//  buttonup
//
//  Created by Russell Blickhan on 3/16/20.
//  Copyright © 2020 Russell Blickhan. All rights reserved.
//

import UIKit

final class SubscribersViewController: UIViewController {
    private let model: SubscribersModel

    init() {
        model = SubscribersModel(apiCache: APICacheImpl.global)
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
