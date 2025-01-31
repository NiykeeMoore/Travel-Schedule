//
//  RowSearchView.swift
//  Travel Schedule
//
//  Created by Niykee Moore on 13.01.2025.
//

import SwiftUI

struct RowSearchView: View {
    @State private var rowString: String
    
    init(rowString: String) {
        self.rowString = rowString
    }
    
    var body: some View {
        HStack(spacing: .zero) {
            Text(rowString)
                .font(AppFonts.Regular.medium)
            Spacer()
            AppImages.Icons.forward
                .imageScale(.large)
        }
    }
}

#Preview {
    RowSearchView(rowString: "Moscow")
}
