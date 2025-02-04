//
//  AppImages.swift
//  Travel Schedule
//
//  Created by Niykee Moore on 31.01.2025.
//

import SwiftUI

enum AppImages {
    enum Checkbox {
        static let on = Image(systemName: "checkmark.square.fill")
        static let off = Image(systemName: "square")
    }
    
    enum RadioButton {
        static let on = Image(systemName: "largecircle.fill.circle")
        static let off = Image(systemName: "circle")
    }
    
    enum Tabs {
        static let schedule = Image(systemName: "arrow.up.message.fill")
        static let settings = Image(systemName: "gearshape.fill")
    }
    
    enum Icons {
        static let cancel = Image(systemName: "xmark.circle.fill").renderingMode(.template)
        static let arrow = Image(systemName: "arrow.forward")
        static let forward = Image(systemName: "chevron.forward")
        static let backward = Image(systemName: "chevron.backward")
        static let search = Image(systemName: "magnifyingglass")
        static let swap = Image(systemName: "arrow.2.squarepath")
        static let marker = Image(systemName: "circle.fill")
    }
}
