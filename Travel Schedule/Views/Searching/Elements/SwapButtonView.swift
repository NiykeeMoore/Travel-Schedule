//
//  SwapButtonView.swift
//  Travel Schedule
//
//  Created by Niykee Moore on 29.01.2025.
//

import SwiftUI

struct SwapButtonView: View {
    @Binding var destinations: [JourneyType: Destination]
    
    var body: some View {
        ZStack {
            Circle()
                .foregroundStyle(AppColors.Universal.white)
                .frame(width: AppSizes.Size.swappingButton)
            Button {
                swapDestinations()
            } label: {
                AppImages.Icons.swap
                    .foregroundStyle(AppColors.Universal.blue)
            }
        }
    }
}

private extension SwapButtonView {
    func swapDestinations() {
        (destinations[.departure], destinations[.arrival]) = (destinations[.arrival], destinations[.departure])
    }
}
#Preview {
    SwapButtonView(destinations: .constant(Destination.sampleData))
}
