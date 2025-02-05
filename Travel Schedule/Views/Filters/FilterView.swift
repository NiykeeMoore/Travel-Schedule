//
//  FilterView.swift
//  Travel Schedule
//
//  Created by Niykee Moore on 13.01.2025.
//

import SwiftUI

struct FilterView: View {
    // MARK: - Constants
    private let timeSectionTitle = "Время отправления"
    private let connectionSectionTitle = "Показывать варианты с пересадками"
    private let buttonTitle = "Применить"
    
    // MARK: - Properties
    @Binding var viewModelFilter: Filter
    @State var currentFilter = Filter()
    
    @Environment(\.presentationMode) var presentationMode
    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading, spacing: .zero) {
            timeSectionView
            connectionSectionView
            Spacer()
            if currentFilter != viewModelFilter {
                buttonView
            }
        }
        .setCustomNavigationBar()
        .onAppear {
            loadFilter()
        }
    }
}

// MARK: - Private views
private extension FilterView {
    var timeSectionView: some View {
        VStack(alignment: .leading, spacing: .zero) {
            show(title: timeSectionTitle)
            CheckboxView(type: .morning, isOn: morningBinding)
            CheckboxView(type: .afternoon, isOn: afternoonBinding)
            CheckboxView(type: .evening, isOn: eveningBinding)
            CheckboxView(type: .night, isOn: atNightBinding)
        }
    }
    
    var connectionSectionView: some View {
        VStack(alignment: .leading, spacing: .zero) {
            show(title: connectionSectionTitle)
            RadioButtonView(isOn: withTransfersBinding)
        }
    }
    
    var buttonView: some View {
        Button {
            saveFilter()
            self.presentationMode.wrappedValue.dismiss()
        } label: {
            Text(buttonTitle)
                .setCustomButton(padding: .horizontal)
        }
    }
}

// MARK: - Private methods
private extension FilterView {
    func show(title: String) -> some View {
        Text(title)
            .font(AppFonts.Bold.medium)
            .padding(AppSizes.Spacing.large)
    }
    
    func loadFilter() {
        currentFilter = viewModelFilter
    }
    
    func saveFilter() {
        viewModelFilter = currentFilter
    }
}

private extension FilterView {
    var morningBinding: Binding<Bool> {
        Binding(
            get: { self.currentFilter.isMorning },
            set: { newValue in
                self.currentFilter = Filter(
                    isWithTransfers: self.currentFilter.isWithTransfers,
                    isAtNight: self.currentFilter.isAtNight,
                    isMorning: newValue,
                    isAfternoon: self.currentFilter.isAfternoon,
                    isEvening: self.currentFilter.isEvening
                )
            }
        )
    }
    
    var afternoonBinding: Binding<Bool> {
        Binding(
            get: { self.currentFilter.isAfternoon },
            set: { newValue in
                self.currentFilter = Filter(
                    isWithTransfers: self.currentFilter.isWithTransfers,
                    isAtNight: self.currentFilter.isAtNight,
                    isMorning: self.currentFilter.isMorning,
                    isAfternoon: newValue,
                    isEvening: self.currentFilter.isEvening
                )
            }
        )
    }
    
    var eveningBinding: Binding<Bool> {
        Binding(
            get: { self.currentFilter.isEvening },
            set: { newValue in
                self.currentFilter = Filter(
                    isWithTransfers: self.currentFilter.isWithTransfers,
                    isAtNight: self.currentFilter.isAtNight,
                    isMorning: self.currentFilter.isMorning,
                    isAfternoon: self.currentFilter.isAfternoon,
                    isEvening: newValue
                )
            }
        )
    }
    
    var atNightBinding: Binding<Bool> {
        Binding(
            get: { self.currentFilter.isAtNight },
            set: { newValue in
                self.currentFilter = Filter(
                    isWithTransfers: self.currentFilter.isWithTransfers,
                    isAtNight: newValue,
                    isMorning: self.currentFilter.isMorning,
                    isAfternoon: self.currentFilter.isAfternoon,
                    isEvening: self.currentFilter.isEvening
                )
            }
        )
    }
    
    var withTransfersBinding: Binding<Bool> {
        Binding(
            get: { self.currentFilter.isWithTransfers },
            set: { newValue in
                self.currentFilter = Filter(
                    isWithTransfers: newValue,
                    isAtNight: self.currentFilter.isAtNight,
                    isMorning: self.currentFilter.isMorning,
                    isAfternoon: self.currentFilter.isAfternoon,
                    isEvening: self.currentFilter.isEvening
                )
            }
        )
    }
}

#Preview {
    NavigationStack {
        FilterView(viewModelFilter: .constant(Filter.customSearch))
    }
}
