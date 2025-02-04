//
//  MarkerView.swift
//  Travel Schedule
//
//  Created by Niykee Moore on 31.01.2025.
//

import SwiftUI

struct MarkerView: View {
    let currentFilter: Filter
    var body: some View {
        AppImages.Icons.marker
            .resizable()
            .scaledToFit()
            .frame(width: AppSizes.Size.marker, height: AppSizes.Size.marker)
            .foregroundStyle(currentFilter == Filter.fullSearch ? AppColors.Universal.blue : AppColors.Universal.red)
    }
}

#Preview {
    VStack {
        MarkerView(currentFilter: Filter.fullSearch)
        MarkerView(currentFilter: Filter.customSearch)
    }
    .padding()
    .background(AppColors.Universal.lightGray)
}
