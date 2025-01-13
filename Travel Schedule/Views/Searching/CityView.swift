//
//  CityView.swift
//  Travel Schedule
//
//  Created by Niykee Moore on 13.01.2025.
//

import SwiftUI

struct CityView: View {
    @Binding var schedule: Schedule
    @Binding var navPath: [ViewsRouter]
    @Binding var direction: Int
    
    @State private var searchString = String()
    
    private var searchingResults: [City] {
        searchString.isEmpty
        ? schedule.cities
        : schedule.cities.filter { $0.title.lowercased().contains(searchString.lowercased()) }
    }
    
    var body: some View {
        VStack(spacing: 0) {
            SearchBarView(searchText: $searchString)
            if searchingResults.isEmpty {
                SearchNothingView(notification: "Город не найден")
            } else {
                ScrollView(.vertical) {
                    ForEach(searchingResults) { city in
                        NavigationLink(value: ViewsRouter.stationView) {
                            RowSearchView(rowString: city.title)
                        }
                        .simultaneousGesture(TapGesture().onEnded {
                            schedule.destinations[direction].cityTitle = city.title
                        })
                        .setRowElement()
                        .padding(.vertical, .spacerL)
                    }
                }
                .padding(.vertical, .spacerL)
            }
            Spacer()
        }
        .setCustomNavigationBar(title: "Выбор города")
        .foregroundStyle(.ccBlack)
        .onAppear {
            searchString = String()
        }
    }
}

#Preview {
    NavigationStack {
        CityView(schedule: .constant(Schedule.sampleData), navPath: .constant([]), direction: .constant(0))
    }
}
