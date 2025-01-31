//
//  SetCustomButton.swift
//  Travel Schedule
//
//  Created by Niykee Moore on 31.01.2025.
//

import SwiftUI

struct SetCustomButton: ViewModifier {
    @State var width: CGFloat?
    @State var padding: Edge.Set
    
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
