//
//  SettingsViewController.swift
//  buttonup
//
//  Created by Russell Blickhan on 6/27/20.
//  Copyright © 2020 Russell Blickhan. All rights reserved.
//

import UIKit

final class SettingsViewController: UIViewController {
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.barStyle = .default
        navigationController?.navigationBar.barTintColor = .systemBackground
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        view.backgroundColor = .systemBackground
    }
}
