//
//  Destination.swift
//  Travel Schedule
//
//  Created by Niykee Moore on 13.01.2025.
//

import Foundation

struct Destination: Hashable, Identifiable {
    let id = UUID()
    var cityTitle: String = ""
    var stationTitle: String = ""
}

extension Destination {
    static var emptyDestinations: [JourneyType: Destination] = [
        .departure: Destination(),
        .arrival: Destination()
    ]

    static let sampleData: [JourneyType: Destination] = [
        .departure: Destination(cityTitle: "Москва", stationTitle: "Ярославский Вокзал"),
        .arrival: Destination(cityTitle: "Санкт-Петербург", stationTitle: "Балтийский вокзал")
    ]
}
