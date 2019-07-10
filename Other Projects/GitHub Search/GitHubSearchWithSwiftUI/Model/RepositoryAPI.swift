//
//  RepositoryModel.swift
//  GitHubSearchWithSwiftUI
//
//  Created by marty-suzuki on 2019/06/06.
//  Copyright © 2019 jp.marty-suzuki. All rights reserved.
//

import Combine
import Foundation

enum RepositoryAPI {
    typealias SearchResponse = AnyPublisher<Result<[Repository], ErrorResponse>, Never>
    typealias SendRequest = (URLRequest) -> AnyPublisher<Data, URLSessionError>

    static func search(query: String) -> SearchResponse {
        search(query: query, sendRequest: URLSession.shared.combine.send)
    }

    static func search(query: String, sendRequest: SendRequest) -> SearchResponse {

        guard var components = URLComponents(string: "https://api.github.com/search/repositories") else {
            return .empty()
        }
        components.queryItems = [URLQueryItem(name: "q", value: query)]

        guard let url = components.url else {
            return .empty()
        }

        var request = URLRequest(url: url)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return sendRequest(request)
            .decode(type: ItemResponse<Repository>.self, decoder: decoder)
            .map { Result<[Repository], ErrorResponse>.success($0.items) }
            .catch { error -> SearchResponse in
                guard case let .serverErrorMessage(_, data)? = error as? URLSessionError else {
                    return .just(.success([]))
                }
                do {
                    let response = try JSONDecoder().decode(ErrorResponse.self, from: data)
                    return .just(.failure(response))
                } catch _ {
                    return .just(.success([]))
                }
            }
            .eraseToAnyPublisher()
    }
}
