//
//  Schedule.swift
//  Travel Schedule
//
//  Created by Niykee Moore on 13.01.2025.
//

import Foundation

struct Schedule: Hashable, Identifiable {
    let id = UUID()
    var cities: [City]
    let stations: [Station]
    var destinations: [Destination]
    let routes: [Route]
    let carriers: [Carrier]
}

extension Schedule {
    static let sampleData = Schedule(
        cities: Mocks.Cities.all,
        stations: Mocks.Stations.all,
        destinations: Mocks.Destinations.empty,
        routes: Mocks.Routes.all,
        carriers: Mocks.Carriers.all
    )
}
