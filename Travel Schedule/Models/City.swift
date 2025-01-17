//
//  City.swift
//  Travel Schedule
//
//  Created by Niykee Moore on 13.01.2025.
//

import Foundation

struct City: Hashable, Identifiable {
    let id = UUID()
    let title: String
}

extension City {
    static let sampleData = [
        City(title: "Москва"),
        City(title: "Санкт-Петербург"),
        City(title: "Сочи"),
        City(title: "Горный Воздух"),
        City(title: "Краснодар"),
        City(title: "Казань"),
        City(title: "Омск")
    ]
}
