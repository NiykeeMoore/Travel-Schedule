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
