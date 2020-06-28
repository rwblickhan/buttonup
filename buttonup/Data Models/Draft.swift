//
//  Draft.swift
//  buttonup
//
//  Created by Russell Blickhan on 4/17/20.
//  Copyright © 2020 Russell Blickhan. All rights reserved.
//

import Foundation

struct Draft: Codable, Hashable {
    let id: String
    let subject: String
    let body: String
    let creationDate: Date
    let modificationDate: Date

    enum CodingKeys: String, CodingKey {
        case id
        case subject
        case body
        case creationDate = "creation_date"
        case modificationDate = "modification_date"
    }
}
