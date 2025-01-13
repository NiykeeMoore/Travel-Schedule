//
//  RowSearchView.swift
//  Travel Schedule
//
//  Created by Niykee Moore on 13.01.2025.
//

import SwiftUI

struct RowSearchView: View {
    @State var rowString: String
    
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
