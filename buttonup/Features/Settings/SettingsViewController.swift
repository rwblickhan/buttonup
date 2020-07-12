//
//  SettingsViewController.swift
//  buttonup
//
//  Created by Russell Blickhan on 6/27/20.
//  Copyright © 2020 Russell Blickhan. All rights reserved.
//

import UIKit

final class SettingsViewController: UIViewController,
    UITextFieldDelegate {
    private let textField = UITextField()
    private let submitButton = UIButton(type: .roundedRect)

    private let model = SettingsModel()

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground

        navigationController?.navigationBar.barStyle = .default
        navigationController?.navigationBar.barTintColor = .systemBackground

        submitButton.setTitle(
            NSLocalizedString("Submit", comment: "Label for API key submission button"),
            for: .normal
        )

        textField.delegate = self
        submitButton.addTarget(self, action: #selector(submit), for: .touchDown)

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

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        if
            let apiKey = UserDefaults.standard.string(forKey: "api_key"),
            !apiKey.isEmpty {
            textField.placeholder = apiKey
        } else {
            textField.placeholder = NSLocalizedString(
                "Enter your API key here!",
                comment: "Placeholder for API key submission field"
            )
        }
    }

    @objc func submit() {
        saveCurrentTextAndResign()
    }

    // MARK: UITextFieldDelegate

    func textFieldShouldReturn(_: UITextField) -> Bool {
        saveCurrentTextAndResign()
        return false
    }

    private func saveCurrentTextAndResign() {
        guard let apiKey = textField.text else { return }
        if model.save(apiKey) { textField.resignFirstResponder() }
    }
}
