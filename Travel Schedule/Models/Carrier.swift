//
//  Carrier.swift
//  Travel Schedule
//
//  Created by Niykee Moore on 13.01.2025.
//

import Foundation

struct Carrier: Hashable, Identifiable {
    let id = UUID()
    let title: String
    let logoName: String
    let email: String
    let phone: String
}

extension Carrier {
    static let sampleData: [Carrier] = [
        Carrier(title: "РЖД", logoName: "rzhd", email: "i.lozgkina@yandex.ru", phone: "+7 (904) 329-27-71"),
        Carrier(title: "ФГК", logoName: "fgk", email: "i.lozgkina@yandex.ru", phone: "+7 (904) 329-27-71"),
        Carrier(title: "Урал логистика", logoName: "ural", email: "i.lozgkina@yandex.ru", phone: "+7 (904) 329-27-71")
    ]
}
