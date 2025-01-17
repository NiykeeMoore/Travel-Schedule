//
//  CarrierView.swift
//  Travel Schedule
//
//  Created by Niykee Moore on 13.01.2025.
//

import SwiftUI

struct CarrierView: View {
    @State private var carrier: Carrier
    @Environment(\.openURL) private var openURL
    
    init(carrier: Carrier) {
        self.carrier = carrier
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Image(carrier.logoName)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity, maxHeight: 104)
                .background(.ccAlwaysWhite)
                .clipShape(RoundedRectangle(cornerRadius: 24))
            Text("ОАО «\(carrier.title)»")
                .font(.boldMedium)
                .frame(maxWidth: .infinity, maxHeight: 29, alignment: .leading)
                .padding(.vertical, .spacerL)
            VStack(alignment: .leading, spacing: 0) {
                Text("E-mail")
                    .font(.regMedium)
                    .foregroundStyle(.ccBlack)
                Button {
                    guard let url = URL(string: "mailto:" + carrier.email) else { return }
                    openURL(url)
                } label: {
                    Text("\(carrier.email)")
                        .font(.regSmall)
                        .foregroundStyle(.ccBlue)
                }
            }
            .frame(height: 60)
            VStack(alignment: .leading, spacing: 0) {
                Text("Телефон")
                    .font(.regMedium)
                    .foregroundStyle(.ccBlack)
                Button {
                    guard let url = URL(string: "tel:" + carrier.phone) else { return }
                    openURL(url)
                } label: {
                    Text("\(carrier.phone)")
                        .font(.regSmall)
                        .foregroundStyle(.ccBlue)
                }
            }
            .frame(height: 60)
            Spacer()
        }
        .padding(.horizontal, .spacerL)
        .setCustomNavigationBar(title: "ИНформация о перевозчике")
    }
}

#Preview {
    NavigationStack {
        CarrierView(carrier: Carrier.sampleData[0])
    }
}
