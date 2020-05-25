//
//  EmailListRequest.swift
//  buttonup
//
//  Created by Russell Blickhan on 5/25/20.
//  Copyright © 2020 Russell Blickhan. All rights reserved.
//

import Foundation

struct EmailListResponse: Codable {
    let results: [Email]
    let next: String?
    let previous: String?
    let count: Int
}

/// See https://api.buttondown.email/v1/schema#operation/emails_list.
struct EmailListRequest: APIRequest {
    typealias Response = EmailListResponse

    var path: APIPath { .emails }

    var method: HTTPMethod { .get }
}
