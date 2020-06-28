//
//  DraftsModel.swift
//  buttonup
//
//  Created by Russell Blickhan on 4/6/20.
//  Copyright © 2020 Russell Blickhan. All rights reserved.
//

import Combine
import Foundation

protocol DraftsModelDelegate: AnyObject {
    func configure(with viewModel: DraftsViewModel)
}

final class DraftsModel {
    private weak var delegate: DraftsModelDelegate?

    // MARK: Services

    private let apiClient: APIClient
    
    // MARK: Requests

    private var draftListRequest: AnyCancellable?
    
    // MARK: Data models
    
    private var drafts = [Draft]()
    
    // MARK: View model
    
    private var viewModel = DraftsViewModel() {
        didSet {
            delegate?.configure(with: viewModel)
        }
    }

    init(apiClient: APIClient, delegate: DraftsModelDelegate) {
        self.apiClient = apiClient
        self.delegate = delegate
    }
    
    deinit {
        draftListRequest?.cancel()
    }
    
    func request() {
        guard let cancellable = apiClient.send(DraftListRequest(), onCompletion: onCompletion, onValue: onValue) else {
            assert(false, "Error while preparing request")
            return
        }
        draftListRequest = cancellable
    }

    private func onCompletion(_ completion: Subscribers.Completion<Error>) {
        draftListRequest = nil
        switch completion {
        case .finished: break
        case .failure(let error): print(error)
        }
        viewModel.refreshing = false
    }

    private func onValue(_ response: DraftListResponse) {
        assert(response.results.count == response.count)
        viewModel.drafts = response.results
    }
}
