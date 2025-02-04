//
//  CarrierView.swift
//  Travel Schedule
//
//  Created by Niykee Moore on 13.01.2025.
//

import SwiftUI

struct CarrierView: View {
    private let title = "ИНформация о перевозчике"
    
    @State private var carrier: Carrier
    
    private var carrierTitle: String { "ОАО «\(carrier.title)»" }
    
    init(carrier: Carrier) {
        self.carrier = carrier
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: .zero) {
            Image(carrier.logoName)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity, maxHeight: AppSizes.Height.carrierFullLogo)
                .background(AppColors.Universal.white)
                .clipShape(RoundedRectangle(cornerRadius: AppSizes.CornerRadius.xxLarge))
            Text(carrierTitle)
                .font(AppFonts.Bold.medium)
                .frame(maxWidth: .infinity, maxHeight: AppSizes.Height.carrierTitle, alignment: .leading)
                .padding(.vertical, AppSizes.Spacing.large)
            
            CarrierContactView(carrier: carrier, type: .email)
            CarrierContactView(carrier: carrier, type: .phone)
            
            Spacer()
        }
        .padding(.horizontal, AppSizes.Spacing.large)
        .setCustomNavigationBar(title: title)
    }
}

#Preview {
    NavigationStack {
        CarrierView(carrier: Carrier.sampleData[0])
    }
}
