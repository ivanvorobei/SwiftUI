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

    static func search(query: String) -> AnyPublisher<[Repository], Error> {

        guard var components = URLComponents(string: "https://api.github.com/search/repositories") else {
            return Publishers.Empty<[Repository], Error>().eraseToAnyPublisher()
        }
        components.queryItems = [URLQueryItem(name: "q", value: query)]

        guard let url = components.url else {
            return Publishers.Empty<[Repository], Error>().eraseToAnyPublisher()
        }

        var request = URLRequest(url: url)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return URLSession.shared.combine.send(request: request)
            .decode(type: ItemResponse<Repository>.self, decoder: decoder)
            .map { $0.items }
            .handleEvents(receiveOutput: { print($0) },
                          receiveCompletion: { print($0)})
            .eraseToAnyPublisher()
    }
}
