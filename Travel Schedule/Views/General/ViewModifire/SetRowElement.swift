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
            .padding(.horizontal, AppSizes.Spacing.large)
            .frame(maxWidth: .infinity, maxHeight: AppSizes.Height.row)
            .font(AppFonts.Regular.medium)
    }
}
