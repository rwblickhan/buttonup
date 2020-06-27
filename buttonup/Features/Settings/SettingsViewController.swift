//
//  SettingsViewController.swift
//  buttonup
//
//  Created by Russell Blickhan on 6/27/20.
//  Copyright © 2020 Russell Blickhan. All rights reserved.
//

import UIKit

final class SettingsViewController: UIViewController {
    private let textField = UITextField()
    private let submitButton = UIButton(type: .roundedRect)
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        navigationController?.navigationBar.barStyle = .default
        navigationController?.navigationBar.barTintColor = .systemBackground
        
        textField.placeholder = NSLocalizedString(
            "Enter your API key here!",
            comment: "Placeholder for API key submission field")
        submitButton.setTitle(
            NSLocalizedString("Submit", comment: "Label for API key submission button"),
            for: .normal)
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        
        // MARK: View hierarchy
        
        view.addSubview(textField)
        view.addSubview(submitButton)
        
        // MARK: Constraints
        
        let viewMargins = view.layoutMarginsGuide
        let textFieldMargins = textField.layoutMarginsGuide
        
        textField.centerXAnchor.constraint(equalTo: viewMargins.centerXAnchor).isActive = true
        textField.centerYAnchor.constraint(equalTo: viewMargins.centerYAnchor).isActive = true
        
        submitButton.topAnchor.constraint(equalTo: textFieldMargins.bottomAnchor, constant: 5).isActive = true
        submitButton.centerXAnchor.constraint(equalTo: viewMargins.centerXAnchor).isActive = true
    }
}
