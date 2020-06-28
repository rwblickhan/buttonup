//
//  ArchivesModel.swift
//  buttonup
//
//  Created by Russell Blickhan on 4/6/20.
//  Copyright © 2020 Russell Blickhan. All rights reserved.
//

import Combine
import Foundation

protocol ArchivesModelDelegate: AnyObject {
    func configure(with viewModel: ArchivesViewModel)
}

final class ArchivesModel {
    private weak var delegate: ArchivesModelDelegate?

    // MARK: Services

    private let apiClient: APIClient

    // MARK: Requests

    private var emailListRequest: AnyCancellable?

    // MARK: Data models

    private var emails = [Email]()

    // MARK: View model

    private var viewModel = ArchivesViewModel() {
        didSet {
            delegate?.configure(with: viewModel)
        }
    }

    init(apiClient: APIClient, delegate: ArchivesModelDelegate) {
        self.apiClient = apiClient
        self.delegate = delegate
    }

    deinit {
        emailListRequest?.cancel()
    }

    func request() {
        guard let cancellable = apiClient.send(EmailListRequest(), onCompletion: onCompletion, onValue: onValue) else {
            assert(false, "Error while preparing request")
            return
        }
        emailListRequest = cancellable
    }

    private func onCompletion(_ completion: Subscribers.Completion<Error>) {
        emailListRequest = nil
        switch completion {
        case .finished: break
        case let .failure(error): print(error)
        }
        viewModel.refreshing = false
    }

    private func onValue(_ response: EmailListResponse) {
        assert(response.results.count == response.count)
        viewModel.emails = response.results
    }
}
