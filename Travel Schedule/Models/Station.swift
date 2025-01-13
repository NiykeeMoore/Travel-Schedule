//
//  Station.swift
//  Travel Schedule
//
//  Created by Niykee Moore on 13.01.2025.
//

import Foundation

struct Station: Hashable, Identifiable {
    let id = UUID()
    let title: String
}

extension Station {
    static let sampleData = [
        Station(title: "Киевский вокзал"),
        Station(title: "Курский вокзал"),
        Station(title: "Ярославский вокзал"),
        Station(title: "Белорусский вокзал"),
        Station(title: "Савеловский вокзал"),
        Station(title: "Ленинградский вокзал")
    ]
}
