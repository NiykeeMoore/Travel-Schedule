//
//  StationView.swift
//  Travel Schedule
//
//  Created by Niykee Moore on 13.01.2025.
//

import SwiftUI

struct StationView: View {
    private let title = "Выбор станции"
    private let notification = "Станция не найдена"
    
    @Binding var schedule: Schedule
    @Binding var navPath: [ViewsRouter]
    @Binding var direction: JourneyType
    
    @State private var searchString = String()
    
    private var searchingResults: [Station] {
        searchString.isEmpty
        ? schedule.stations
        : schedule.stations.filter { $0.title.lowercased().contains(searchString.lowercased()) }
    }
    
    var body: some View {
        VStack(spacing: .zero) {
            SearchBarView(searchText: $searchString)
            if searchingResults.isEmpty {
                SearchResultEmptyView(notification: notification)
            } else {
                ScrollView(.vertical) {
                    ForEach(searchingResults) { station in
                        Button {
                            if var destination = schedule.destinations[direction] {
                                destination.stationTitle = station.title
                                schedule.destinations[direction] = destination
                            }
                            navPath.removeAll()
                        } label: {
                            RowSearchView(rowString: station.title)
                        }
                        .setRowElement()
                        .padding(.vertical, AppSizes.Spacing.large)
                    }
                }
                .padding(.vertical, AppSizes.Spacing.large)
            }
            Spacer()
        }
        .setCustomNavigationBar(title: title)
        .foregroundStyle(AppColors.LightDark.black)
        .onAppear {
            searchString = String()
        }
    }
}

#Preview {
    NavigationStack {
        StationView(
            schedule: .constant(Schedule.sampleData),
            navPath: .constant([]),
            direction: .constant(.departure)
        )
    }
}
