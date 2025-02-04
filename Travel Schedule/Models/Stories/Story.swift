//
//  Story.swift
//  Travel Schedule
//
//  Created by Niykee Moore on 31.01.2025.
//

import Foundation

// MARK: - Model structure
struct Story: Identifiable {
    let id = UUID()
    let imageName: String
    var isShowed: Bool = false
    let title: String
    let storyPages: [StoryPage]
}

// MARK: - Model mock data
extension Story {
    static let title = Array(repeating: "title", count: 7).joined(separator: " ").capitalized

    static let mockData: [Story] = [
        Story(imageName: "preview1", title: title, storyPages: StoryPage.mockData1),
        Story(imageName: "preview2", title: title, storyPages: StoryPage.mockData2),
        Story(imageName: "preview3", title: title, storyPages: StoryPage.mockData3),
        Story(imageName: "preview4", title: title, storyPages: StoryPage.mockData4),
        Story(imageName: "preview5", title: title, storyPages: StoryPage.mockData5),
        Story(imageName: "preview6", title: title, storyPages: StoryPage.mockData6)
    ]
}
