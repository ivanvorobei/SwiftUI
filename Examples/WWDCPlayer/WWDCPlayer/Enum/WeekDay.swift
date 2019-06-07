//
//  WeekDay.swift
//  WWDCPlayer
//
//  Created by ms on 2019/06/05.
//  Copyright © 2019 daybreak. All rights reserved.
//

import Foundation
import SwiftUI

enum WeekDay: String, CaseIterable, Identifiable {
    var id: String {
        return self.rawValue
    }
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
}

let allWeekDays = WeekDay.allCases
