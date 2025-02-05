//
//  Station.swift
//  Travel Schedule
//
//  Created by Niykee Moore on 13.01.2025.
//

import Foundation

// MARK: - Struct
struct Station: Hashable, Identifiable, Sendable {
    let id = UUID()
    let title: String
    let type: String
    let code: String
    let latitude: Double
    let longitude: Double
}
