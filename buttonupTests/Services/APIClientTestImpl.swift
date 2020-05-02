//
//  APIClientTestImpl.swift
//  buttonupTests
//
//  Created by Russell Blickhan on 4/19/20.
//  Copyright © 2020 Russell Blickhan. All rights reserved.
//

@testable import buttonup
import Combine
import Foundation

struct APIClientTestImpl: APIClient {
    
    func send<T>(_ request: T, onCompletion: @escaping (Subscribers.Completion<Error>) -> Void, onValue: @escaping (T.Response) -> Void) -> AnyCancellable? where T : APIRequest {
        // TODO
    }
}
