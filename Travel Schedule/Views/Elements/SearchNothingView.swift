//
//  SearchNothingView.swift
//  Travel Schedule
//
//  Created by Niykee Moore on 13.01.2025.
//

import SwiftUI

struct SearchNothingView: View {
    @State var notification: String
    
    var body: some View {
        Spacer()
        Text(notification)
            .font(.boldMedium)
        Spacer()
    }
}

#Preview {
    SearchNothingView(notification: "Nothing is here")
}
