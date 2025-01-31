//
//  AppFonts.swift
//  Travel Schedule
//
//  Created by Niykee Moore on 29.01.2025.
//

import SwiftUI

enum AppFonts {
    enum Regular {
        static let small = Font.system(size: 12, weight: .regular)
        static let medium = Font.system(size: 17, weight: .regular)
        static let large = Font.system(size: 20, weight: .regular)
    }
    
    enum Bold {
        static let small = Font.system(size: 17, weight: .bold)
        static let medium = Font.system(size: 24, weight: .bold)
        static let large = Font.system(size: 34, weight: .bold)
    }
}
