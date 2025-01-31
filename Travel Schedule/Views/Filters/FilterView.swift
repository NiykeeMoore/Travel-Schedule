//
//  FilterView.swift
//  Travel Schedule
//
//  Created by Niykee Moore on 13.01.2025.
//

import SwiftUI

struct FilterView: View {
    // MARK: - Constants
    private let buttonTitle = "Применить"

    // MARK: - Properties
    @Binding var filter: Filter
    @State var currentFilter = Filter()
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack(alignment: .leading, spacing: .zero) {
            FilterTimeSectionView(currentFilter: $currentFilter)
            FilterConnectionSectionView(currentFilter: $currentFilter)
            
            Spacer()
            
            if currentFilter != filter {
                Button {
                    filter = currentFilter
                    self.presentationMode.wrappedValue.dismiss()
                } label: {
                    ButtonTitleView(title: buttonTitle)
                }
                .setCustomButton(padding: .horizontal)
            }
        }
        .setCustomNavigationBar()
        .onAppear {
            currentFilter = filter
        }
    }
}

#Preview {
    NavigationStack {
        FilterView(filter: .constant(Filter.fullSearch))
    }
}
