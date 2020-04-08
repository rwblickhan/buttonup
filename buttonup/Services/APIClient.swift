//
//  APIClient.swift
//  buttonup
//
//  Created by Russell Blickhan on 4/7/20.
//  Copyright © 2020 Russell Blickhan. All rights reserved.
//

import Foundation

protocol APIClient {
    func send(_ request: Request)
    func enqueue(_ request: Request)
}

enum APIPath: String {
    case drafts = "/v1/drafts"
}

enum HTTPMethod: String {
    case get
    case post
    case patch
    case put
    case delete
}

protocol Request {
    var path: APIPath { get }
    var method: HTTPMethod { get }
    var parameters: [(String, Any)]? { get }
    var body: [String: Any]? { get }
    func parseResponse()
}

final class APIClientImpl: APIClient {
    static let global = APIClientImpl()
    
    private struct Constants {
        static let baseURL = URL(string: "https://api.buttondown.email")!
    }

    fileprivate init() { }
    
    func send(_ request: Request) {
        // TODO
    }
    
    func enqueue(_ request: Request) {
        // TODO
    }
}
