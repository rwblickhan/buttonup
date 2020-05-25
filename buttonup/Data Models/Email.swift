//
//  Email.swift
//  buttonup
//
//  Created by Russell Blickhan on 5/25/20.
//  Copyright © 2020 Russell Blickhan. All rights reserved.
//

import Foundation

struct Email: Codable, Hashable {
    let id: String
    let includedTags: [Tag]
    let excludedTags: [Tag]
    let publishDate: Date
    let subject: String
    let body: String
    let emailType: String
}
