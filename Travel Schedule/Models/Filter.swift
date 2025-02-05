//
//  Filter.swift
//  Travel Schedule
//
//  Created by Niykee Moore on 13.01.2025.
//

import Foundation

struct Filter: Hashable, Sendable {
    let isWithTransfers: Bool
    let isAtNight: Bool
    let isMorning: Bool
    let isAfternoon: Bool
    let isEvening: Bool

    init(
        isWithTransfers: Bool = true,
        isAtNight: Bool = true,
        isMorning: Bool = true,
        isAfternoon: Bool = true,
        isEvening: Bool = true
    ) {
        self.isWithTransfers = isWithTransfers
        self.isAtNight = isAtNight
        self.isMorning = isMorning
        self.isAfternoon = isAfternoon
        self.isEvening = isEvening
    }
}

extension Filter {
    static let fullSearch = Filter()
    static let customSearch = Filter(isWithTransfers: false, isMorning: false)
}
