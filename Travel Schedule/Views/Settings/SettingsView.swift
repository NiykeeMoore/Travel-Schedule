//
//  SettingsView.swift
//  Travel Schedule
//
//  Created by Niykee Moore on 13.01.2025.
//

import SwiftUI

struct SettingsView: View {
    private enum Titles {
        static let darkMode = "Тёмная тема"
        static let agreement = "Пользовательское соглашение"
        static let description = "Приложение использует API «Яндекс.Расписания»"
        static let version = "Версия \(Bundle.main.appVersionLong).\(Bundle.main.appBuild)"
    }
    
    @Binding var darkMode: Bool
    
    var body: some View {
        VStack(spacing: .zero) {
            Toggle(Titles.darkMode, isOn: $darkMode)
                .setRowElement()
                .tint(AppColors.Universal.blue)
            NavigationLink {
                AgreementView()
            } label: {
                RowSearchView(rowString: Titles.agreement)
            }
            .setRowElement()
            
            Spacer()
            
            VStack(alignment: .center, spacing: AppSizes.Spacing.large) {
                Text(Titles.description)
                Text(Titles.version)
            }
            .font(AppFonts.Regular.small)
            .frame(minHeight: AppSizes.Height.about)
        }
        .padding(.vertical, AppSizes.Spacing.xxLarge)
        .foregroundStyle(AppColors.LightDark.black)
    }
}

#Preview {
    NavigationStack {
        SettingsView(darkMode: .constant(false))
    }
}
