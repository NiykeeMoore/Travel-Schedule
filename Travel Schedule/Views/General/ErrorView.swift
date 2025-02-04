//
//  ErrorView.swift
//  Travel Schedule
//
//  Created by Niykee Moore on 13.01.2025.
//

import SwiftUI

struct ErrorView: View {
    let errorType: ErrorType
    
    var body: some View {
        Image(errorType.imageName)
        Text(errorType.description)
            .font(AppFonts.Bold.medium)
    }
}

#Preview {
    ErrorView(errorType: ErrorType.serverError)
}
