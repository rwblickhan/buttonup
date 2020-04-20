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
    func configure(with viewModel: SubscribersViewModel)
}

final class SubscribersModel {
    private weak var delegate: SubscribersModelDelegate?
    
    // MARK: Services

    private let apiClient: APIClient

    // MARK: Requests

    private var subscriberListRequest: AnyCancellable?
    
    // MARK: View model
    
    private var viewModel: SubscribersViewModel {
        didSet {
            delegate?.configure(with: viewModel)
        }
    }

    init(apiClient: APIClient = APIClientImpl.global, delegate: SubscribersModelDelegate) {
        self.apiClient = apiClient
        self.delegate = delegate
        self.viewModel = SubscribersViewModel()
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
        switch completion {
        case .finished: break
        case .failure(let error): print(error)
        }
        viewModel.refreshing = false
    }

    private func onValue(_ response: SubscriberListResponse) {
        assert(response.results.count == response.count)
        viewModel.subscribers = response.results
    }
}
