//
//  SubscriberListRequest.swift
//  buttonup
//
//  Created by Russell Blickhan on 4/9/20.
//  Copyright © 2020 Russell Blickhan. All rights reserved.
//

import Foundation

struct SubscriberListResponse: Codable {
    let results: [Subscriber]
    let next: String?
    let previous: String?
    let count: Int
}

struct SubscriberListRequest: APIRequest {
    typealias Response = SubscriberListResponse

    var path: APIPath { .subscribers }

    var method: HTTPMethod { .get }
}
