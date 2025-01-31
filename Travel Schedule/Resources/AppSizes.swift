//
//  AppSizes.swift
//  Travel Schedule
//
//  Created by Niykee Moore on 29.01.2025.
//

import SwiftUI

enum AppSizes {
    enum CornerRadius {
        static let xSmall: CGFloat = 4.0
        static let small: CGFloat = 8.0
        static let medium: CGFloat = 12.0
        static let large: CGFloat = 16.0
        static let xLarge: CGFloat = 20.0
        static let xxLarge: CGFloat = 24.0
        
        enum Custom {
            static let progressBar: CGFloat = 3.0
            static let searchBar: CGFloat = 10.0
            static let story: CGFloat = 40.0
        }
    }
    
    enum Spacing {
        static let xSmall: CGFloat = 4.0
        static let small: CGFloat = 8.0
        static let medium: CGFloat = 12.0
        static let large: CGFloat = 16.0
        static let xLarge: CGFloat = 20.0
        static let xxLarge: CGFloat = 24.0
        
        enum Custom {
            static let progressBarElements: CGFloat = 6.0
            static let progressBar: CGFloat = 35.0
            static let story: CGFloat = 40.0
            static let closeButton: CGFloat = 57.0
        }
    }
    
    enum Size {
        static let marker: CGFloat = 8.0
        static let icon: CGFloat = 17.0
        static let toggle: CGFloat = 24.0
        static let button: CGFloat = 30.0
        static let swappingButton: CGFloat = 36.0
        static let logo: CGFloat = 38.0
    }
    
    enum Line {
        static let small: CGFloat = 1.0
        static let large: CGFloat = 4.0
    }
    
    enum Height {
        static let progressBar: CGFloat = 6.0
        static let carrierTitle: CGFloat = 29.0
        static let searchBar: CGFloat = 36.0
        static let about: CGFloat = 44.0
        static let searchingRow: CGFloat = 48.0
        static let timeLine: CGFloat = 48.0
        static let row: CGFloat = 60.0
        static let searchButton: CGFloat = 60.0
        static let carrierFullLogo: CGFloat = 104.0
        static let route: CGFloat = 104.0
        static let searchingForm: CGFloat = 128.0
        static let storyPreview: CGFloat = 140.0
        static let stories: CGFloat = 188.0
    }
    
    enum Width {
        static let storyPreview: CGFloat = 92.0
        static let searchButton: CGFloat = 150.0
    }
}
