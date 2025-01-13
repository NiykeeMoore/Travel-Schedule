//
//  Schedule.swift
//  Travel Schedule
//
//  Created by Niykee Moore on 13.01.2025.
//

import Foundation

struct Schedule: Hashable, Identifiable {
    let id = UUID()
    let cities: [City]
    let stations: [Station]
    var destinations: [Destination]
    let routes: [Route]
    let carriers: [Carrier]
}

extension Schedule {
    static let sampleData = Schedule(
        cities: City.sampleData,
        stations: Station.sampleData,
        destinations: Destination.emptyDestination,
        routes: Route.sampleData,
        carriers: Carrier.sampleData
    )
}
