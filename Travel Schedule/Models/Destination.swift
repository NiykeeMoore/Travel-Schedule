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
    static var emptyDestination = [Destination(), Destination()]

    static let sampleData: [Destination] = [
        Destination(cityTitle: "Москва", stationTitle: "Ярославский Вокзал"),
        Destination(cityTitle: "Санкт-Петербург", stationTitle: "Балтийский вокзал")
    ]
}
