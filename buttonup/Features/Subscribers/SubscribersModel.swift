//
//  SubscribersModel.swift
//  buttonup
//
//  Created by Russell Blickhan on 4/6/20.
//  Copyright © 2020 Russell Blickhan. All rights reserved.
//

import Combine
import Foundation

final class SubscribersModel {
    // MARK: Services
    
    private let apiClient: APIClient
    
    // MARK: Requests
    
    private var subscriberListRequest: AnyCancellable?

    init(apiClient: APIClient = APIClientImpl.global) {
        self.apiClient = apiClient
    }
    
    deinit {
        subscriberListRequest?.cancel()
    }
    
    func request() {
        guard let cancellable = apiClient.send(SubscriberListRequest(), onCompletion: onCompletion, onValue: onValue) else {
            assert(false, "Error while preparing request")
            return
        }
        subscriberListRequest = cancellable
    }
    
    private func onCompletion(_ error: Subscribers.Completion<Error>) {
        subscriberListRequest = nil
    }
    
    private func onValue(_ response: SubscriberListResponse) {
        assert(response.results.count == response.count)
        for email in response.results.map({ $0.email }) {
            print(email)
        }
    }
}
