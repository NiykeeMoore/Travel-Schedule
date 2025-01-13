//
//  Story.swift
//  Travel Schedule
//
//  Created by Niykee Moore on 13.01.2025.
//

import Foundation

struct Story: Hashable, Identifiable {
    let id = UUID()
    let previewImageName: String
    let pageImageNames: [String]
    let title: String
    let text: String
    let isRead: Bool
}

extension Story {
    static let sampleData = [
        Story(
            previewImageName: "preview1",
            pageImageNames: ["big1-1", "big1-2"],
            title: "Text Text",
            text: "Text Text Text Text Text Text Text Text",
            isRead: false
        ),
        Story(
            previewImageName: "preview2",
            pageImageNames: ["big2-1", "big2-2"],
            title: "Text Text",
            text: "Text Text Text Text Text Text Text Text",
            isRead: false
        ),
        Story(
            previewImageName: "preview3",
            pageImageNames: ["big3-1", "big3-2"],
            title: "Text Text",
            text: "Text Text Text Text Text Text Text Text",
            isRead: true
        ),
        Story(
            previewImageName: "preview4",
            pageImageNames: ["big4-1", "big4-2"],
            title: "Text Text",
            text: "Text Text Text Text Text Text Text Text",
            isRead: true
        ),
        Story(
            previewImageName: "preview5",
            pageImageNames: ["big5-1", "big5-2"],
            title: "Text Text",
            text: "Text Text Text Text Text Text Text Text",
            isRead: true
        ),
        Story(
            previewImageName: "preview6",
            pageImageNames: ["big6-1", "big6-2"],
            title: "Text Text",
            text: "Text Text Text Text Text Text Text Text",
            isRead: true
        )
    ]
}
