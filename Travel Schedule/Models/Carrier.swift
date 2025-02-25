//
//  Carrier.swift
//  Travel Schedule
//
//  Created by Niykee Moore on 13.01.2025.
//

import Foundation

struct Carrier: Hashable, Identifiable, Sendable {
    let id = UUID()
    let code: Int
    let title: String
    let logoUrl: String
    let logoSVGUrl: String
    let placeholder: String
    let email: String
    let phone: String
    let contacts: String
}
