//
//  SetCustomNavigationBar.swift
//  Travel Schedule
//
//  Created by Niykee Moore on 13.01.2025.
//

import SwiftUI

struct SetCustomNavigationBar: ViewModifier {
    @State var title: String
    
    func body(content: Content) -> some View {
        content
            .navigationTitle(title)
            .navigationBarTitleDisplayMode(.inline)
            .setCustomNavBackButton()
    }
}
