//
//  Email.swift
//  buttonup
//
//  Created by Russell Blickhan on 5/25/20.
//  Copyright © 2020 Russell Blickhan. All rights reserved.
//

import Foundation

enum EmailType: String, Codable {
    case `public`
    case `private`
}

struct Email: Codable, Hashable {
    let id: String
    let includedTags: [Tag]
    let excludedTags: [Tag]
    let publishDate: Date
    let subject: String
    let body: String
    let emailType: EmailType
    
    enum CodingKeys: String, CodingKey {
        case id
        case includedTags = "included_tags"
        case excludedTags = "excluded_tags"
        case publishDate = "publish_date"
        case subject
        case body
        case emailType = "email_type"
    }
}
