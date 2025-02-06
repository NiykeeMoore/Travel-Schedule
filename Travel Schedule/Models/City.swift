//
//  City.swift
//  Travel Schedule
//
//  Created by Niykee Moore on 13.01.2025.
//

import Foundation

// MARK: - Struct
struct City: Hashable, Identifiable, Sendable {
    let id = UUID()
    let title: String
    let yandexCode: String
    let stationsCount: Int

    enum Codes: String, CaseIterable, Hashable {
        case express, yandex, esr, esrCode, yandexCode
    }
}
