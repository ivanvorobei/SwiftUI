//
//  Note.swift
//  SwiftUINote
//
//  Created by chanju Jeon on 05/06/2019.
//  Copyright © 2019 we'd. All rights reserved.
//

import SwiftUI

struct Note: Hashable, Codable, Identifiable {
    let id = UUID()
    var text: String
    var date = Date()
}
