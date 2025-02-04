//
//  ProgressBarView.swift
//  Travel Schedule
//
//  Created by Niykee Moore on 31.01.2025.
//

import SwiftUI

struct ProgressBarView: View {
    // MARK: - Constants
    let numberOfSections: Int
    let progress: CGFloat
    private let backgroundColor = AppColors.Universal.white
    private let accentColor = AppColors.Universal.blue

    // MARK: - View
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                // Background rectangle
                Rectangle()
                    .foregroundStyle(backgroundColor)
                    .frame(width: geometry.size.width)

                // Filling's rectangle
                Rectangle()
                    .foregroundStyle(accentColor)
                    .frame(width: min(progress * geometry.size.width, geometry.size.width))
            }
            .frame(height: AppSizes.Height.progressBar)
            .mask {
                // All shapes setup by the mask
                MaskView(numberOfSections: numberOfSections, backgroundColor: backgroundColor)
            }
        }
    }
}

// MARK: - Private structures
private struct MaskView: View {
    let numberOfSections: Int
    let backgroundColor: Color

    var body: some View {
        HStack(spacing: AppSizes.Spacing.Custom.progressBarElements) {
            ForEach(0..<numberOfSections, id: \.self) { _ in
                MaskFragmentView(backgroundColor: backgroundColor)
            }
        }
    }
}

private struct MaskFragmentView: View {
    let backgroundColor: Color
    var body: some View {
        RoundedRectangle(cornerRadius: AppSizes.CornerRadius.xSmall)
            .frame(height: AppSizes.Height.progressBar)
            .fixedSize(horizontal: false, vertical: true)
            .foregroundStyle(backgroundColor)
    }
}

#Preview {
    ProgressBarView(numberOfSections: 5, progress: 0.5)
        .background(
            AppColors.Universal.red.opacity(0.5)
        )
}
