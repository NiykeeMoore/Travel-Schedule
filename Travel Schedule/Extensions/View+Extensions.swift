//
//  View+Extensions.swift
//  Travel Schedule
//
//  Created by Niykee Moore on 13.01.2025.
//

import SwiftUI

extension View {
    func setRowElement() -> some View {
        modifier(SetRowElement())
    }
    
    func setCustomNavBackButton() -> some View {
        modifier(SetCustomNavBackButton())
    }
    
    func setCustomNavigationBar(title: String = "") -> some View {
        modifier(SetCustomNavigationBar(title: title))
    }
}
