//
//  SearchBarView.swift
//  Travel Schedule
//
//  Created by Niykee Moore on 13.01.2025.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var searchText: String
    @Environment(\.colorScheme) var colorScheme
    
    var placeholder = "Введите запрос"
    
    var body: some View {
        HStack(spacing: 0) {
            Image(systemName: "magnifyingglass")
                .resizable()
                .frame(width: .iconSize, height: .iconSize)
                .padding(.horizontal, .spacerS)
                .foregroundColor(searchText.isEmpty ? .ccGray : .ccBlack)
            
            TextField(placeholder, text: $searchText)
                .font(.regMedium)
                .foregroundColor(.ccBlack)
                .autocorrectionDisabled(true)
                .autocapitalization(.none)
            
            if !searchText.isEmpty {
                Button {
                    searchText = String()
                    UIApplication.shared.sendAction(
                        #selector(UIResponder.resignFirstResponder),
                        to: nil,
                        from: nil,
                        for: nil
                    )
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .resizable()
                        .frame(width: .iconSize, height: .iconSize)
                        .padding(.horizontal, .spacerS)
                        .foregroundColor(.ccGray)
                }
            }
        }
        .frame(height: 36)
        .background(colorScheme == .light ? .ccLightGray : .ccGray)
        .cornerRadius(10)
        .padding(.horizontal, .spacerL)
    }
}
