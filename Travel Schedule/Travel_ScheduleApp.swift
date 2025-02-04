//
//  Travel_ScheduleApp.swift
//  Travel Schedule
//
//  Created by Niykee Moore on 09.12.2024.
//

import SwiftUI

@main
struct Travel_ScheduleApp: App {
    @State private var schedule = Schedule.sampleData
    @StateObject var settings = SettingsViewModel()
    
    var body: some Scene {
        WindowGroup {
            RootTabView(schedule: $schedule)
                .environmentObject(settings)
                .environment(\.colorScheme, settings.darkMode ? .dark : .light)
        }
    }
}
