//
//  CarrierContactView.swift
//  Travel Schedule
//
//  Created by Niykee Moore on 31.01.2025.
//

import SwiftUI

struct CarrierContactView: View {
    enum ContactType {
        case email, phone
    }

    private let email = "E-mail"
    private let phone = "Телефон"

    let carrier: Carrier
    let type: ContactType

    // swiftlint:disable:next attributes
    @Environment(\.openURL) private var openURL

    private var carrierEmail: String { "\(carrier.email)" }
    private var carrierPhone: String { "\(carrier.phone)" }
    private var emailUrl: String { "mailto:" + carrier.email }
    private var phoneUrl: String { "tel:" + carrier.phone }

    var body: some View {
        VStack(alignment: .leading, spacing: .zero) {
            Text(type == .email ? email : phone)
                .font(AppFonts.Regular.medium)
                .foregroundStyle(AppColors.LightDark.black)
            Button {
                guard let url = URL(string: type == .email ? emailUrl : phoneUrl) else { return }
                openURL(url)
            } label: {
                Text(type == .email ? carrierEmail : carrierPhone)
                    .font(AppFonts.Regular.small)
                    .foregroundStyle(AppColors.Universal.blue)
            }
        }
        .frame(height: AppSizes.Height.row)
    }
}

#Preview {
    VStack {
        CarrierContactView(carrier: Carrier.sampleData[0], type: .email)
        CarrierContactView(carrier: Carrier.sampleData[0], type: .phone)
    }
}
