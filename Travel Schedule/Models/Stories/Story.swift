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
