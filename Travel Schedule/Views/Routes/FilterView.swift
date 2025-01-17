//
//  FilterView.swift
//  Travel Schedule
//
//  Created by Niykee Moore on 13.01.2025.
//

import SwiftUI

struct FilterView: View {
    @Binding var filter: Filter
    @State private var currentFilter = Filter()
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Время отправления")
                .font(.boldMedium)
                .padding(.spacerL)
            
            Toggle("Утро 06:00 - 12:00", isOn: $currentFilter.isMorning)
                .setRowElement()
                .toggleStyle(CheckboxToggleStyle())
            
            Toggle("День 12:00 - 18:00", isOn: $currentFilter.isAfternoon)
                .setRowElement()
                .toggleStyle(CheckboxToggleStyle())
            
            Toggle("Вечер 18:00 - 00:00", isOn: $currentFilter.isEvening)
                .setRowElement()
                .toggleStyle(CheckboxToggleStyle())
            
            Toggle("Ночь 00:00 - 06:00", isOn: $currentFilter.isAtNight)
                .setRowElement()
                .toggleStyle(CheckboxToggleStyle())
            
            Text("Показывать варианты с пересадками")
                .font(.boldMedium)
                .padding(.spacerL)
            
            VStack(spacing: 0) {
                Toggle("Да", isOn: $currentFilter.isWithTransfers)
                    .setRowElement()
                    .toggleStyle(RadioButtonToggleStyle())
                
                Toggle("Нет", isOn: $currentFilter.isWithTransfers.not)
                    .setRowElement()
                    .toggleStyle(RadioButtonToggleStyle())
            }
            
            Spacer()
            
            if currentFilter != filter {
                Button {
                    filter = currentFilter
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Применить")
                        .font(.boldSmall)
                }
                .frame(maxWidth: .infinity, maxHeight: 60)
                .background(.ccBlue)
                .foregroundStyle(.ccAlwaysWhite)
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .padding(.horizontal, .spacerL)
            }
        }
        .setCustomNavigationBar()
        .onAppear {
            currentFilter = filter
        }
    }
}

#Preview {
    NavigationStack {
        FilterView(filter: .constant(Filter.fullSearch))
    }
}

extension Binding where Value == Bool {
    var not: Binding<Value> {
        Binding<Value>(
            get: { !self.wrappedValue },
            set: { self.wrappedValue = !$0 }
        )
    }
}
