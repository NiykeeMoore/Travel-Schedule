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
    let city: City
    let station: Station
    
    func update(newCity: City) -> Self {
        .init(city: newCity, station: station)
    }

    func update(newStation: Station) -> Self {
        .init(city: city, station: newStation)
    }
}
