//
//  APIRequest.swift
//  buttonup
//
//  Created by Russell Blickhan on 4/9/20.
//  Copyright © 2020 Russell Blickhan. All rights reserved.
//

import Foundation

enum APIPath: String {
    case drafts = "/v1/drafts"
    case emails = "/v1/emails"
    case subscribers = "/v1/subscribers"
}

enum HTTPMethod: String {
    case get
    case post
    case patch
    case put
    case delete
}

protocol APIRequest {
    associatedtype Response: Codable
    var path: APIPath { get }
    var method: HTTPMethod { get }
    var parameters: [(String, String)]? { get }
    var body: Data? { get }
}

extension APIRequest {
    var parameters: [(String, String)]? { nil }
    var body: Data? { nil }
}
