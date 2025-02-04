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
    @Binding var direction: JourneyType
    
    var body: some View {
        VStack(spacing: .zero) {
            PreviewStoriesView(stories: $stories)
            MainSearchView(schedule: $schedule,
                           navPath: $navPath,
                           directionId: $direction)
            Spacer()
        }
    }
}

#Preview {
    NavigationStack {
        SearchTabView(
            stories: .constant(Story.mockData),
            schedule: .constant(Schedule.sampleData),
            navPath: .constant([]),
            direction: .constant(.departure)
        )
    }
}
