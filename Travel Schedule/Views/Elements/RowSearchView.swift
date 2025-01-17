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
        HStack(spacing: 0) {
            Text(rowString)
                .font(.regMedium)
            Spacer()
            Image(systemName: "chevron.forward")
                .imageScale(.large)
        }
    }
}

#Preview {
    RowSearchView(rowString: "Moscow")
}
