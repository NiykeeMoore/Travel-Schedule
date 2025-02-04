//
//  PreviewStoriesView.swift
//  Travel Schedule
//
//  Created by Niykee Moore on 31.01.2025.
//

import SwiftUI

struct PreviewStoriesView: View {
    // MARK: - Constants
    private let rows = [GridItem(.flexible())]
    
    // MARK: - Properties
    @Binding var stories: [Story]
    
    @State var isStoriesShowing = false
    @State var storyIndex = 0
    
    // MARK: - View
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: rows, alignment: .center, spacing: AppSizes.Spacing.medium) {
                ForEach(Array(stories.enumerated()), id: \.offset) { index, story in
                    StoryPreviewView(storyPreview: story)
                        .onTapGesture {
                            isStoriesShowing = true
                            storyIndex = index
                        }
                        .fullScreenCover(isPresented: $isStoriesShowing, onDismiss: didDismiss) {
                            StoriesView(stories: $stories, storyIndex: $storyIndex)
                        }
                }
            }
            .padding(.horizontal, AppSizes.Spacing.large)
            .padding(.vertical, AppSizes.Spacing.xxLarge)
        }
        .frame(height: AppSizes.Height.stories)
    }
}
private extension PreviewStoriesView {
    func didDismiss() {
        isStoriesShowing = false
    }
}

#Preview {
    PreviewStoriesView(stories: .constant(Story.mockData))
}
