//
//  Filter.swift
//  Travel Schedule
//
//  Created by Niykee Moore on 13.01.2025.
//

import Foundation

struct Filter: Hashable {
    var isWithTransfers = true
    var isAtNight = true
    var isMorning = true
    var isAfternoon = true
    var isEvening = true
}

extension Filter {
    static let fullSearch = Filter()
}
