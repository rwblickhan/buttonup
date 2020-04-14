//
//  SubscribersModel.swift
//  buttonup
//
//  Created by Russell Blickhan on 4/6/20.
//  Copyright © 2020 Russell Blickhan. All rights reserved.
//

import Combine
import UIKit

protocol SubscribersModelDelegate: AnyObject {
    func subscribersModelDidUpdate(_ subscribers: [Subscriber]) // TODO replace
    func subscribersModelDidFinishRefreshing() // TODO replace
}

final class SubscribersModel {
    private weak var delegate: SubscribersModelDelegate?
    
    // MARK: Services

    private let apiClient: APIClient

    // MARK: Requests

    private var subscriberListRequest: AnyCancellable?
    
    // MARK: Data models
    
    private var subscribers = [Subscriber]()

    init(apiClient: APIClient = APIClientImpl.global, delegate: SubscribersModelDelegate) {
        self.apiClient = apiClient
        self.delegate = delegate
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

    private func onCompletion(_ completion: Subscribers.Completion<Error>) {
        subscriberListRequest = nil
        delegate?.subscribersModelDidFinishRefreshing()
        switch completion {
        case .finished: break
        case .failure(let error): print(error)
        }
    }

    private func onValue(_ response: SubscriberListResponse) {
        assert(response.results.count == response.count)
        subscribers = response.results
    }
}
