//
//  SubscribersCell.swift
//  buttonup
//
//  Created by Russell Blickhan on 4/13/20.
//  Copyright © 2020 Russell Blickhan. All rights reserved.
//

import UIKit

final class SubscribersCell: UITableViewCell {
    static let CellIdentifier = "SubscribersCell"
    
    private let label = UILabel()
    
    func configure(with subscriber: Subscriber) {
        let margins = contentView.layoutMarginsGuide
        label.centerXAnchor.constraint(equalTo: margins.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: margins.centerYAnchor).isActive = true

        label.text = subscriber.email
    }
}
