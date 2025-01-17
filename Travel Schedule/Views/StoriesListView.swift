//
//  StoriesListView.swift
//  Travel Schedule
//
//  Created by Niykee Moore on 13.01.2025.
//

import SwiftUI

struct StoriesListView: View {
    @Binding var stories: [Story]
    
    private let rows = [GridItem(.flexible())]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: rows, alignment: .center, spacing: 12) {
                ForEach($stories, id: \.self) { $story in
                    ZStack {
                        Image("\(story.previewImageName)")
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                            .opacity(story.isRead ? 0.5 : 1)
                        RoundedRectangle(cornerRadius: 16)
                            .strokeBorder(.ccBlue, lineWidth: story.isRead ? 0 : 4)
                    }
                    .frame(width: 92, height: 140)
                }
            }
            .padding(.horizontal, .spacerL)
            .padding(.vertical, .spacerXXL)
        }
        .frame(height: 188)
    }
}

#Preview {
    StoriesListView(stories: .constant(Story.sampleData))
}
