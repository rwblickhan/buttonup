//
//  DraftListRequest.swift
//  buttonup
//
//  Created by Russell Blickhan on 4/17/20.
//  Copyright © 2020 Russell Blickhan. All rights reserved.
//

import Foundation

struct DraftListResponse: Codable {
    let results: [Draft]
}

/// See https://api.buttondown.email/v1/schema#operation/drafts_list.
struct DraftListRequest: APIRequest {
    typealias Response = DraftListResponse

    var path: APIPath { .drafts }

    var method: HTTPMethod { .get }
}
