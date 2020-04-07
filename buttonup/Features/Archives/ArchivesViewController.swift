//
//  ArchivesViewController.swift
//  buttonup
//
//  Created by Russell Blickhan on 3/16/20.
//  Copyright © 2020 Russell Blickhan. All rights reserved.
//

import UIKit

final class ArchivesViewController: UIViewController {
    private let model: ArchivesModel

    init() {
        model = ArchivesModel(apiCache: APICacheImpl.global)
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) is not implemented")
    }
}
