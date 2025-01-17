//
//  SearchTabView.swift
//  Travel Schedule
//
//  Created by Niykee Moore on 13.01.2025.
//

import SwiftUI

struct SearchTabView: View {
    @Binding var stories: [Story]
    @Binding var schedule: Schedule
    @Binding var navPath: [ViewsRouter]
    @Binding var direction: Int
    
    var body: some View {
        VStack(spacing: 0.0) {
            StoriesListView(stories: $stories)
            MainSearchView(schedule: $schedule, navPath: $navPath, direction: $direction)
            Spacer()
        }
    }
}

#Preview {
    NavigationStack {
        SearchTabView(
            stories: .constant(Story.sampleData),
            schedule: .constant(Schedule.sampleData),
            navPath: .constant([]),
            direction: .constant(0)
        )
    }
}
