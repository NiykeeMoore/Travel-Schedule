//
//  Route.swift
//  Travel Schedule
//
//  Created by Niykee Moore on 13.01.2025.
//

import Foundation

struct Route: Hashable, Identifiable, Sendable {
    let id = UUID()
    let code: String
    let date: String
    var departureTime: String
    var arrivalTime: String
    var durationTime: String
    let connectionStation: String
    var isDirect: Bool {
        connectionStation.isEmpty
    }
    let carrierCode: Int
}
