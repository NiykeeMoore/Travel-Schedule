//
//  SetCustomButton.swift
//  Travel Schedule
//
//  Created by Niykee Moore on 31.01.2025.
//

import SwiftUI

struct SetCustomButton: ViewModifier {
    private let width: CGFloat?
    private let padding: Edge.Set
    
    init(width: CGFloat?, padding: Edge.Set) {
        self.width = width
        self.padding = padding
    }
    
    func body(content: Content) -> some View {
        content
            .foregroundStyle(AppColors.Universal.white)
            .frame(maxHeight: AppSizes.Height.searchButton)
            .frame(maxWidth: (width != nil) ? width : .infinity)
            .background(AppColors.Universal.blue)
            .clipShape(RoundedRectangle(cornerRadius: AppSizes.CornerRadius.large))
            .padding(padding, AppSizes.Spacing.large)
    }
}
