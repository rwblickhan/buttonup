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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(label)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with subscriber: Subscriber) {
        let margins = contentView.layoutMarginsGuide
        label.centerXAnchor.constraint(equalTo: margins.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: margins.centerYAnchor).isActive = true

        label.text = subscriber.email
    }
}
