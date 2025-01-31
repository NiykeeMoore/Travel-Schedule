//
//  ButtonTitleView.swift
//  Travel Schedule
//
//  Created by Niykee Moore on 31.01.2025.
//

import SwiftUI

struct ButtonTitleView: View {
    let title: String
    var body: some View {
        Text(title)
            .font(AppFonts.Bold.small)
    }
}

#Preview {
    ButtonTitleView(title: "Уточнить время")
}
