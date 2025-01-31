//
//  StoriesTabView.swift
//  Travel Schedule
//
//  Created by Niykee Moore on 31.01.2025.
//

import SwiftUI

struct StoriesTabView: View {
    // MARK: - Properties
    @Binding var stories: [Story]
    @Binding var storyIndex: Int
    @Binding var currentPage: Int
    
    // MARK: - View
    var body: some View {
        TabView(selection: $storyIndex) {
            ForEach(Array(stories.enumerated()), id: \.offset) { storyIndex, story in
                TabView(selection: $currentPage) {
                    ForEach(Array(story.storyPages.enumerated()), id: \.offset) { pageIndex, page in
                        StoryPageView(model: page)
                            .tag(pageIndex)
                    }
                }
                .tag(storyIndex)
            }
        }
        .ignoresSafeArea()
        .tabViewStyle(.page(indexDisplayMode: .never))
    }
}

#Preview {
    StoriesTabView(
        stories: .constant(Story.mockData),
        storyIndex: .constant(1),
        currentPage: .constant(0)
    )
}
