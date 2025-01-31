//
//  SetCustomNavBackButton.swift
//  Travel Schedule
//
//  Created by Niykee Moore on 13.01.2025.
//

import SwiftUI

struct SetCustomNavBackButton: ViewModifier {
    @Environment(\.dismiss) var dismiss
    
    @ViewBuilder
    @MainActor
    func body(content: Content) -> some View {
        content
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        AppImages.Icons.backward
                            .imageScale(.large)
                            .foregroundColor(AppColors.LightDark.black)
                    }
                }
            }
            .contentShape(Rectangle())
            .gesture(
                DragGesture(coordinateSpace: .local)
                    .onEnded { value in
                        if value.translation.width > .zero
                            && value.translation.height > -30
                            && value.translation.height < 30 {
                            dismiss()
                        }
                    }
            )
    }
}
