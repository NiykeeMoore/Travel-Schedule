//
//  SetRowElement.swift
//  Travel Schedule
//
//  Created by Niykee Moore on 13.01.2025.
//

import SwiftUI

struct SetRowElement: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.regMedium)
            .padding(.horizontal, .spacerL)
            .frame(maxWidth: .infinity, maxHeight: 60)
    }
}
