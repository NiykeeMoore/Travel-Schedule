//
//  StoryPage.swift
//  Travel Schedule
//
//  Created by Niykee Moore on 31.01.2025.
//

import Foundation

// MARK: - Model structure
struct StoryPage: Identifiable {
    var id = UUID()
    var imageName: String
    var title: String
    var description: String
}

// MARK: - Model mock data
extension StoryPage {
    static let title = Array(repeating: "title", count: 7).joined(separator: " ").capitalized
    static let description = Array(repeating: "text", count: 20).joined(separator: " ")

    static let mockData1: [StoryPage] = [
        StoryPage(imageName: "big1-1", title: title, description: description),
        StoryPage(imageName: "big1-2", title: title, description: description)
    ]
    static let mockData2: [StoryPage] = [
        StoryPage(imageName: "big2-1", title: title, description: description),
        StoryPage(imageName: "big2-2", title: title, description: description)
    ]
    static let mockData3: [StoryPage] = [
        StoryPage(imageName: "big3-1", title: title, description: description),
        StoryPage(imageName: "big3-2", title: title, description: description)
    ]
    static let mockData4: [StoryPage] = [
        StoryPage(imageName: "big4-1", title: title, description: description),
        StoryPage(imageName: "big4-2", title: title, description: description)
    ]
    static let mockData5: [StoryPage] = [
        StoryPage(imageName: "big5-1", title: title, description: description),
        StoryPage(imageName: "big5-2", title: title, description: description)
    ]
    static let mockData6: [StoryPage] = [
        StoryPage(imageName: "big6-1", title: title, description: description),
        StoryPage(imageName: "big6-2", title: title, description: description)
    ]
}
