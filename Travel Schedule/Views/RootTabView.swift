//
//  RootView.swift
//  Travel Schedule
//
//  Created by Niykee Moore on 13.01.2025.
//

import SwiftUI

struct RootTabView: View {
    @Binding var schedule: Schedule
    @Binding var darkMode: Bool
    @State private var navPath: [ViewsRouter] = []
    @State private var direction: Int = .departure
    @State private var stories: [Story] = Story.sampleData
    
    var body: some View {
        NavigationStack(path: $navPath) {
            TabView {
                SearchTabView(stories: $stories, schedule: $schedule, navPath: $navPath, direction: $direction)
                    .tabItem {
                        Image(systemName: "arrow.up.message.fill")
                    }
                SettingsView(darkMode: $darkMode)
                    .tabItem {
                        Image(systemName: "gearshape.fill")
                    }
            }
            .accentColor(.ccBlack)
            .toolbar(.visible, for: .tabBar)
            .navigationDestination(for: ViewsRouter.self) { pathValue in
                switch pathValue {
                case .cityView:
                    CityView(schedule: $schedule, navPath: $navPath, direction: $direction)
                        .toolbar(.hidden, for: .tabBar)
                case .stationView:
                    StationView(schedule: $schedule, navPath: $navPath, direction: $direction)
                        .toolbar(.hidden, for: .tabBar)
                case .routeView:
                    RoutesListView(schedule: $schedule)
                        .toolbar(.hidden, for: .tabBar)
                }
            }
        }
    }
}

#Preview {
    RootTabView(schedule: .constant(Schedule.sampleData), darkMode: .constant(false))
}
