//
//  Array+Extensions.swift
//  Travel Schedule
//
//  Created by Niykee Moore on 04.02.2025.
//


extension Array where Element: Hashable {
    func difference(from other: [Element]) -> [Element] {
        let mainArrayAsSet = Set(self)
        let otherArrayAsSet = Set(other)
        return Array(mainArrayAsSet.symmetricDifference(otherArrayAsSet))
    }
}