//
//  ErrorResponse.swift
//  GitHubSearchWithSwiftUI
//
//  Created by John Holdsworth on 09/07/2019.
//  Copyright © 2019 jp.marty-suzuki. All rights reserved.
//

import Foundation

struct ErrorResponse: Decodable, Error {
    let message: String
}
