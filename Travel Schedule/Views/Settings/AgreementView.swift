//
//  AgreementView.swift
//  Travel Schedule
//
//  Created by Niykee Moore on 13.01.2025.
//

import SwiftUI


struct AgreementView: View {
    private let title = "Пользовательское соглашение"
    private let urlString = "https://developer.apple.com/documentation/technologies"

    @State private var isPresentWebView = false

    var body: some View {
        if let url = URL(string: urlString) {
            WebView(url: url)
                .ignoresSafeArea(.all, edges: .bottom)
                .setCustomNavigationBar(title: title)
        }
    }
}

#Preview {
    NavigationStack {
        AgreementView()
    }
}

#Preview {
    NavigationStack {
        AgreementView()
    }
}
