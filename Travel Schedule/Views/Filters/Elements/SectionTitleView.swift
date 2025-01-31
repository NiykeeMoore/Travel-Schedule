//
//  SectionTitleView.swift
//  Travel Schedule
//
//  Created by Niykee Moore on 31.01.2025.
//

import SwiftUI

struct SectionTitleView: View {
    // MARK: - Constants
    let title: String

    // MARK: - View
    var body: some View {
        Text(title)
            .font(AppFonts.Bold.medium)
            .padding(AppSizes.Spacing.large)
    }
}

#Preview {
    SectionTitleView(title: "Departure Time")
}
