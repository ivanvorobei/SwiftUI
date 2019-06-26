//
//  URLSession.Combine.swift
//  GitHubSearchWithSwiftUI
//
//  Created by marty-suzuki on 2019/06/05.
//  Copyright © 2019 jp.marty-suzuki. All rights reserved.
//

import Combine
import Foundation

extension URLSession: CombineCompatible {}

extension CombineExtension where Base == URLSession {

    func send(request: URLRequest) -> AnyPublisher<Data, URLSessionError> {

        AnyPublisher<Data, URLSessionError> { [base] subscriber in

            let task = base.dataTask(with: request) { data, response, error in

                guard let response = response as? HTTPURLResponse else {
                    subscriber.receive(completion: .failure(.invalidResponse))
                    return
                }

                guard 200..<300 ~= response.statusCode else {
                    let e = URLSessionError.serverError(statusCode: response.statusCode,
                                                        error: error)
                    subscriber.receive(completion: .failure(e))
                    return
                }

                guard let data = data else {
                    subscriber.receive(completion: .failure(.noData))
                    return
                }

                if let error = error {
                    subscriber.receive(completion: .failure(.unknown(error)))
                } else {
                    _ = subscriber.receive(data)
                    subscriber.receive(completion: .finished)
                }
            }

            // TODO: cancel task when subscriber cancelled
            task.resume()
        }
    }
}

enum URLSessionError: Error {
    case invalidResponse
    case noData
    case serverError(statusCode: Int, error: Error?)
    case unknown(Error)
}
