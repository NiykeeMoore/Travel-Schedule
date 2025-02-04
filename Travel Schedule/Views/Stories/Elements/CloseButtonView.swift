//
//  CloseButtonView.swift
//  Travel Schedule
//
//  Created by Niykee Moore on 31.01.2025.
//

import SwiftUI

struct CloseButtonView: View {
    // MARK: - Constants
    let action: () -> Void

    // MARK: - View
    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                Circle()
                    .foregroundStyle(AppColors.Universal.white)
                AppImages.Icons.cancel
                    .resizable()
                    .foregroundStyle(AppColors.Universal.black)
            }
            .frame(width: AppSizes.Size.button, height: AppSizes.Size.button)
        }
    }
}

#Preview {
    CloseButtonView { }
        .padding()
        .background(AppColors.Universal.blue)
}
