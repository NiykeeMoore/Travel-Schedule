//
//  SearchNothingView.swift
//  Travel Schedule
//
//  Created by Niykee Moore on 13.01.2025.
//

import SwiftUI

struct SearchResultEmptyView: View {
    let notification: String

    var body: some View {
        Spacer()
        Text(notification)
            .font(AppFonts.Bold.medium)
        Spacer()
    }
}

#Preview {
    SearchResultEmptyView(notification: "Nothing is here")
}
