//
//  DraftsViewController.swift
//  buttonup
//
//  Created by Russell Blickhan on 3/16/20.
//  Copyright © 2020 Russell Blickhan. All rights reserved.
//

import UIKit

final class DraftsViewController: UIViewController {
    private let model: DraftsModel

    init() {
        model = DraftsModel(apiClient: APIClientImpl.global)
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.barStyle = .default
        navigationController?.navigationBar.barTintColor = .background
        
        model.request()
    }
}
