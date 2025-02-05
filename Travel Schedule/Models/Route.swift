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
    let departureTime: String
    let arrivalTime: String
    let durationTime: String
    let connectionStation: String
    let isDirect: Bool
    let carrierCode: Int
    
    init(
        code: String,
        date: String,
        departureTime: String,
        arrivalTime: String,
        durationTime: String,
        connectionStation: String,
        carrierCode: Int
    ) {
        self.code = code
        self.date = date
        self.departureTime = departureTime
        self.arrivalTime = arrivalTime
        self.durationTime = durationTime
        self.connectionStation = connectionStation
        self.isDirect = connectionStation.isEmpty
        self.carrierCode = carrierCode
    }
}
