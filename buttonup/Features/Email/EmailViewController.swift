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
    private let bodyLabel = UITextView()
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

        let scrollView = UIScrollView()

        titleLabel.text = model.email.subject
        bodyLabel.text = model.email.body

        scrollView.translatesAutoresizingMaskIntoConstraints = false

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textAlignment = .left
        titleLabel.numberOfLines = 0

        bodyLabel.translatesAutoresizingMaskIntoConstraints = false

        // MARK: View Hierarchy

        view.addSubview(scrollView)

        scrollView.addSubview(titleLabel)
        scrollView.addSubview(bodyLabel)

        // MARK: Layout

        let viewMargins = view.layoutMarginsGuide
        scrollView.leadingAnchor.constraint(equalTo: viewMargins.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: viewMargins.trailingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: viewMargins.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: viewMargins.bottomAnchor).isActive = true

        let scrollViewMargins = scrollView.layoutMarginsGuide
        titleLabel.leadingAnchor.constraint(equalTo: scrollViewMargins.leadingAnchor).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: scrollViewMargins.trailingAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: scrollViewMargins.topAnchor).isActive = true

        let titleLabelMargins = titleLabel.layoutMarginsGuide
        bodyLabel.leadingAnchor.constraint(equalTo: scrollViewMargins.leadingAnchor).isActive = true
        bodyLabel.trailingAnchor.constraint(equalTo: scrollViewMargins.trailingAnchor).isActive = true
        bodyLabel.topAnchor.constraint(equalTo: titleLabelMargins.bottomAnchor).isActive = true

        bodyLabel.setContentCompressionResistancePriority(.required, for: .vertical)
        bodyLabel.setContentHuggingPriority(.required, for: .vertical)
    }
}
