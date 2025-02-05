//
//  SearchScreenViewModel.swift
//  Travel Schedule
//
//  Created by Niykee Moore on 04.02.2025.
//


import SwiftUI

@MainActor
final class SearchScreenViewModel: ObservableObject {
    let searchButtonTitle = "Найти"
    let dummyDirection = ["Откуда", "Куда"]

    @Published private(set) var destinations: [Destination]
    @Published private(set) var direction: JourneyType = .departure
    @Published private(set) var currentError: ErrorType = .serverError

    var isSearchButtonReady: Bool {
        !destinations[JourneyType.departure.rawValue].city.title.isEmpty &&
        !destinations[JourneyType.departure.rawValue].station.title.isEmpty &&
        !destinations[JourneyType.arrival.rawValue].city.title.isEmpty &&
        !destinations[JourneyType.arrival.rawValue].station.title.isEmpty
    }

    init(destinations: [Destination] = Mocks.Destinations.empty) {
        self.destinations = destinations
    }

    func swapDestinations() {
        let depIndex = JourneyType.departure.rawValue
        let arrIndex = JourneyType.arrival.rawValue
        (destinations[depIndex], destinations[arrIndex]) = (destinations[arrIndex], destinations[depIndex])
    }

    func setDirection(to newDirection: JourneyType) {
        self.direction = newDirection
    }

    func saveSelected(city: City) {
        let updateModel = destinations[direction.rawValue].update(newCity: city)
        destinations[direction.rawValue] = updateModel
    }

    func saveSelected(station: Station) {
        let updateModel = destinations[direction.rawValue].update(newStation: station)
        destinations[direction.rawValue] = updateModel
    }
}
