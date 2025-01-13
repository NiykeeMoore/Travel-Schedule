//
//  StationView.swift
//  Travel Schedule
//
//  Created by Niykee Moore on 13.01.2025.
//

import SwiftUI

struct StationView: View {
    @Binding var schedule: Schedule
    @Binding var navPath: [ViewsRouter]
    @Binding var direction: Int
    
    @State private var searchString = String()
    
    private var searchingResults: [Station] {
        searchString.isEmpty
        ? schedule.stations
        : schedule.stations.filter { $0.title.lowercased().contains(searchString.lowercased()) }
    }
    
    var body: some View {
        VStack(spacing: 0) {
            SearchBarView(searchText: $searchString)
            if searchingResults.isEmpty {
                SearchNothingView(notification: "Станция не найдена")
            } else {
                ScrollView(.vertical) {
                    ForEach(searchingResults) { station in
                        Button {
                            schedule.destinations[direction].stationTitle = station.title
                            navPath.removeAll()
                        } label: {
                            RowSearchView(rowString: station.title)
                        }
                        .setRowElement()
                        .padding(.vertical, .spacerL)
                    }
                }
                .padding(.vertical, .spacerL)
            }
            Spacer()
        }
        .setCustomNavigationBar(title: "Выбор станции")
        .foregroundStyle(.ccBlack)
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
