//
//  EmailViewController.swift
//  buttonup
//
//  Created by Russell Blickhan on 7/12/20.
//  Copyright © 2020 Russell Blickhan. All rights reserved.
//

import UIKit

class EmailViewController: UIViewController {
    private let titleLabel = UILabel()
    private let model: EmailModel

    init(email: Email) {
        model = EmailModel(email: email)
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) is not implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground

        titleLabel.text = model.email.subject

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textAlignment = .left
        titleLabel.numberOfLines = 0

        // MARK: View Hierarchy

        view.addSubview(titleLabel)

        // MARK: Layout

        let margins = view.layoutMarginsGuide
        titleLabel.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: margins.topAnchor).isActive = true
    }
}
