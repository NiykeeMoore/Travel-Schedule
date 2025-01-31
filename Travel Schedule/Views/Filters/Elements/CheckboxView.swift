//
//  CheckboxView.swift
//  Travel Schedule
//
//  Created by Niykee Moore on 31.01.2025.
//

import SwiftUI

struct CheckboxView: View {
    // MARK: - Constants
    enum CheckboxType {
        case morning, afternoon, evening, night
        
        var title: String {
            switch self {
            case .morning: return String(localized: "Утро 06:00 - 12:00")
            case .afternoon: return String(localized: "День 12:00 - 18:00")
            case .evening: return String(localized: "Вечер 18:00 - 00:00")
            case .night: return String(localized: "Ночь 00:00 - 06:00")
            }
        }
    }
    let type: CheckboxType
    
    // MARK: - Properties
    @Binding var isOn: Bool
    
    // MARK: - View
    var body: some View {
        Toggle(type.title, isOn: $isOn)
            .setRowElement()
            .toggleStyle(.checkBox)
    }
}

#Preview {
    VStack {
        CheckboxView(type: .morning, isOn: .constant(Filter.fullSearch.isMorning))
        CheckboxView(type: .morning, isOn: .constant(Filter.customSearch.isMorning))
    }
}
