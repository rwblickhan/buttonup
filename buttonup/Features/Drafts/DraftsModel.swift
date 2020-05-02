//
//  DraftsModel.swift
//  buttonup
//
//  Created by Russell Blickhan on 4/6/20.
//  Copyright © 2020 Russell Blickhan. All rights reserved.
//

import Combine
import Foundation

final class DraftsModel {
    // MARK: Services

    private let apiClient: APIClient
    
    // MARK: Requests

    private var draftListRequest: AnyCancellable?
    
    // MARK: Data models
    
    private var drafts = [Draft]()

    init(apiClient: APIClient) {
        self.apiClient = apiClient
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
        // TODO
        switch completion {
        case .finished: break
        case .failure(let error): print(error)
        }
    }

    private func onValue(_ response: DraftListResponse) {
        drafts = response.results
    }
}
