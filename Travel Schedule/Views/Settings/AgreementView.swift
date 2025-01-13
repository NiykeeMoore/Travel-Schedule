//
//  AgreementView.swift
//  Travel Schedule
//
//  Created by Niykee Moore on 13.01.2025.
//

import SwiftUI

struct AgreementView: View {
    @State private var isPresentWebView = false
    private let urlString = Bool.random()
    ? "https://developer.apple.com/documentation/technologies"
    : "https://yandex.ru/legal/practicum_offer"
    
    
    var body: some View {
        VStack {
            switch Bool.random() {
            case true:
                if let url = URL(string: urlString) {
                    WebView(url: url)
                        .ignoresSafeArea(.all, edges: .bottom)
                        .setCustomNavigationBar(title: "Пользовательское соглашение")
                }
            case false:
                ErrorView(errorType: Bool.random() ? .connectionError : .serverError)
            }
        }
    }
}

#Preview {
    NavigationStack {
        AgreementView()
    }
}
