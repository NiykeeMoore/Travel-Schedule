//
//  CheckboxToggleStyle.swift
//  Travel Schedule
//
//  Created by Niykee Moore on 13.01.2025.
//

import SwiftUI

struct CheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack(spacing: .zero) {
            configuration.label
            
            Spacer()
            
            (configuration.isOn ? AppImages.Checkbox.on : AppImages.Checkbox.off)
                .resizable()
                .frame(width: AppSizes.Size.toggle, height: AppSizes.Size.toggle)
                .onTapGesture { configuration.isOn.toggle() }
        }
    }
}

extension ToggleStyle where Self == CheckboxToggleStyle {
    static var checkBox: Self { Self() }
}
