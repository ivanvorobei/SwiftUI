//
//  Platform.swift
//  WWDCPlayer
//
//  Created by sohee on 2019/06/05.
//  Copyright © 2019 daybreak. All rights reserved.
//

import Foundation

enum Platform: String, CaseIterable {
    case iOS, macOS, tvOS, watchOS
}

let allPlatforms = Platform.allCases
