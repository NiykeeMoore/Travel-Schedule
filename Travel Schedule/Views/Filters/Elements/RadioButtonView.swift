//
//  RadioButtonView.swift
//  Travel Schedule
//
//  Created by Niykee Moore on 31.01.2025.
//

import SwiftUI

struct RadioButtonView: View {
    // MARK: - Constants
    enum RadioButtonState {
        case on, off
        
        var title: String {
            switch self {
            case .on: return String(localized: "Да")
            case .off: return String(localized: "Нет")
            }
        }
    }
    
    // MARK: - Properties
    @Binding var isOn: Bool
    
    // MARK: - View
    var body: some View {
        VStack(spacing: .zero) {
            Toggle(RadioButtonState.on.title, isOn: $isOn)
                .setRowElement()
                .toggleStyle(.radioButton)
            
            Toggle(RadioButtonState.off.title, isOn: $isOn.not)
                .setRowElement()
                .toggleStyle(.radioButton)
        }    }
}

#Preview {
    VStack {
        RadioButtonView(isOn: .constant(true))
            .padding()
        RadioButtonView(isOn: .constant(false))
            .padding()
    }
}
