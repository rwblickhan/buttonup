//
//  ArchivesCell.swift
//  buttonup
//
//  Created by Russell Blickhan on 5/25/20.
//  Copyright © 2020 Russell Blickhan. All rights reserved.
//

import UIKit

final class ArchivesCell: UITableViewCell {
    static let CellIdentifier = "ArchivesCell"
    
    private let label = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        
        // MARK: View Hierarchy
        
        contentView.addSubview(label)
        
        // MARK: Layout
        
        let margins = contentView.layoutMarginsGuide
        label.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
        label.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: margins.centerYAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with email: Email) {
        label.text = email.subject
    }
}
