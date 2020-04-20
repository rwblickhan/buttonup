//
//  APIClient.swift
//  buttonup
//
//  Created by Russell Blickhan on 4/7/20.
//  Copyright © 2020 Russell Blickhan. All rights reserved.
//

import Combine
import Foundation

protocol APIClient {
    func send<T: APIRequest>(
        _ request: T,
        onCompletion: @escaping (Subscribers.Completion<Error>) -> Void,
        onValue: @escaping (T.Response) -> Void
    ) -> AnyCancellable?
}

final class APIClientImpl: APIClient {
    static let global = APIClientImpl()

    private struct Constants {
        static let baseURL = URL(string: "https://api.buttondown.email")!
        static let apiKey = "e2865801-26f4-4b1f-b876-0c59d464cee7"
    }

    fileprivate init() {}

    func send<T: APIRequest>(
        _ request: T,
        onCompletion: @escaping (Subscribers.Completion<Error>) -> Void,
        onValue: @escaping (T.Response) -> Void
    ) -> AnyCancellable? {
        var urlComponents = URLComponents()
        urlComponents.path = request.path.rawValue
        if let parameters = request.parameters {
            assert(request.method != .post, "POST requests should not have parameters")
            urlComponents.queryItems = parameters.map { parameter in
                let (name, value) = parameter
                return URLQueryItem(name: name, value: value)
            }
        }
        guard let url = urlComponents.url(relativeTo: Constants.baseURL) else {
            assert(false, "URL should always be able to be constructed")
            return nil
        }

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = request.method.rawValue
        urlRequest.httpBody = request.body
        // Be a very naughty boy and overwrite Authorization header
        urlRequest.setValue("Token \(Constants.apiKey)", forHTTPHeaderField: "Authorization")

        return URLSession.shared.dataTaskPublisher(for: urlRequest)
            .tryMap { (data, response) -> Data in
                guard
                    let httpResponse = response as? HTTPURLResponse,
                    httpResponse.statusCode == 200
                else { throw URLError(.badServerResponse) }
                return data
            }
            .decode(type: T.Response.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: onCompletion, receiveValue: onValue)
    }
}
