//
//  Tag.swift
//  buttonup
//
//  Created by Russell Blickhan on 3/20/20.
//  Copyright © 2020 Russell Blickhan. All rights reserved.
//

import Foundation

@objc class Tag: NSObject {
    @NSManaged var color: String?
    @NSManaged var creationDate: Date?
    @NSManaged var id: String?
    @NSManaged var name: String?
    @NSManaged var tagDescription: String?
}
