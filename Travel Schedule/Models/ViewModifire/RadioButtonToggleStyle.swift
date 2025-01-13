//
//  RadioButtonToggleStyle.swift
//  Travel Schedule
//
//  Created by Niykee Moore on 13.01.2025.
//

import SwiftUI

struct RadioButtonToggleStyle: ToggleStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        HStack(spacing: 0) {
            configuration.label
            Spacer()
            (configuration.isOn ? Image(systemName: "circle.inset.filled") :  Image(systemName: "circle"))
                .resizable()
                .frame(width: 24, height: 24)
                .onTapGesture { configuration.isOn.toggle() }
        }
    }
}
