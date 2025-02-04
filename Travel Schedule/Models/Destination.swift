//
//  Destination.swift
//  Travel Schedule
//
//  Created by Niykee Moore on 13.01.2025.
//

import Foundation

// MARK: - Struct
struct Destination: Hashable, Identifiable, Sendable {
    let id = UUID()
    var city: City
    var station: Station
}

// MARK: - Mock data
extension Destination {
    static let emptyDestination = [
        Destination(
            city: City(title: "", yandexCode: "", stationsCount: 0),
            station: Station(title: "", type: "", code: "", latitude: 0, longitude: 0)
        ),
        Destination(
            city: City(title: "", yandexCode: "", stationsCount: 0),
            station: Station(title: "", type: "", code: "", latitude: 0, longitude: 0)
        )
    ]

    static let sampleData: [Destination] = [
        Destination(
            city: City(title: "Москва", yandexCode: "", stationsCount: 0),
            station: Station(title: "Ярославский Вокзал", type: "", code: "", latitude: 0, longitude: 0)
        ),
        Destination(
            city: City(title: "Санкт-Петербург", yandexCode: "", stationsCount: 0),
            station: Station(title: "Балтийский вокзал", type: "", code: "", latitude: 0, longitude: 0)
        )
    ]
}
