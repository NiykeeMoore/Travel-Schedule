//
//  Binding+Extensions.swift
//  Travel Schedule
//
//  Created by Niykee Moore on 31.01.2025.
//

import SwiftUI

extension Binding where Value == Bool {
    var not: Binding<Value> {
        Binding<Value>(
            get: { !wrappedValue },
            set: { wrappedValue = !$0 }
        )
    }
}
