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
