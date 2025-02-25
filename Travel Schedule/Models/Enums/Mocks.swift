//
//  Mocks.swift
//  Travel Schedule
//
//  Created by Niykee Moore on 05.02.2025.
//

import Foundation

enum Mocks {
    
    // MARK: - Carrier Mocks
    enum Carriers {
        static let rzhd = Carrier(
            code: 129,
            title: "РЖД",
            logoUrl: "rzhd",
            logoSVGUrl: "rzhd",
            placeholder: "airplane",
            email: "i.lozgkina@yandex.ru",
            phone: "+7 (904) 329-27-71",
            contacts: "Контактная информация"
        )
        
        static let fgk = Carrier(
            code: 8565,
            title: "ФГК",
            logoUrl: "fgk",
            logoSVGUrl: "fgk",
            placeholder: "cablecar",
            email: "i.lozgkina@yandex.ru",
            phone: "+7 (904) 329-27-71",
            contacts: "Контактная информация"
        )
        
        static let ural = Carrier(
            code: 26,
            title: "Урал логистика",
            logoUrl: "ural",
            logoSVGUrl: "ural",
            placeholder: "ferry",
            email: "i.lozgkina@yandex.ru",
            phone: "+7 (904) 329-27-71",
            contacts: "Контактная информация"
        )
        
        static let all: [Carrier] = [rzhd, fgk, ural]
    }
    
    // MARK: - City Mocks
    enum Cities {
        static let all: [City] = [
            City(title: "Москва", yandexCode: "", stationsCount: 0),
            City(title: "Санкт-Петербург", yandexCode: "", stationsCount: 0),
            City(title: "Сочи", yandexCode: "", stationsCount: 0),
            City(title: "Горный Воздух", yandexCode: "", stationsCount: 0),
            City(title: "Краснодар", yandexCode: "", stationsCount: 0),
            City(title: "Казань", yandexCode: "", stationsCount: 0),
            City(title: "Омск", yandexCode: "", stationsCount: 0)
        ]
    }
    
    // MARK: - Destination Mocks
    enum Destinations {
        static let empty: [Destination] = [
            Destination(
                city: City(title: "", yandexCode: "", stationsCount: 0),
                station: Station(title: "", type: "", code: "", latitude: 0, longitude: 0)
            ),
            Destination(
                city: City(title: "", yandexCode: "", stationsCount: 0),
                station: Station(title: "", type: "", code: "", latitude: 0, longitude: 0)
            )
        ]
        
        static let sample: [Destination] = [
            Destination(
                city: City(title: "Москва", yandexCode: "", stationsCount: 0),
                station: Station(title: "Ярославский Вокзал", type: "", code: "", latitude: 0, longitude: 0)
            ),
            Destination(
                city: City(title: "Санкт-Петербург", yandexCode: "", stationsCount: 0),
                station: Station(title: "Балтийский вокзал", type: "", code: "", latitude: 0, longitude: 0)
            )
        ]
    }
    
    // MARK: - Route Mocks
    enum Routes {
        static let all: [Route] = [
            Route(
                code: "020U_6_2",
                date: "2024-01-14",
                departureTime: "22:30",
                arrivalTime: "08:15",
                durationTime: "20 часов",
                connectionStation: "Костроме",
                carrierCode: 129
            ),
            Route(
                code: "020U_6_2",
                date: "2024-01-15",
                departureTime: "01:15",
                arrivalTime: "09:00",
                durationTime: "9 часов",
                connectionStation: "",
                carrierCode: 129
            ),
            Route(
                code: "020U_6_2",
                date: "2024-01-16",
                departureTime: "12:30",
                arrivalTime: "21:00",
                durationTime: "9 часов",
                connectionStation: "",
                carrierCode: 129
            ),
            Route(
                code: "020U_6_2",
                date: "2024-01-17",
                departureTime: "22:30",
                arrivalTime: "08:15",
                durationTime: "20 часов",
                connectionStation: "Костроме",
                carrierCode: 129
            ),
            Route(
                code: "020U_6_2",
                date: "2024-01-17",
                departureTime: "18:00",
                arrivalTime: "01:00",
                durationTime: "7 часов",
                connectionStation: "",
                carrierCode: 129
            )
        ]
    }
    
    // MARK: - Station Mocks
    enum Stations {
        static let all: [Station] = [
            Station(title: "Киевский вокзал", type: "dummy", code: "dummy", latitude: 0, longitude: 0),
            Station(title: "Курский вокзал", type: "dummy", code: "dummy", latitude: 0, longitude: 0),
            Station(title: "Ярославский вокзал", type: "dummy", code: "dummy", latitude: 0, longitude: 0),
            Station(title: "Белорусский вокзал", type: "dummy", code: "dummy", latitude: 0, longitude: 0),
            Station(title: "Савеловский вокзал", type: "dummy", code: "dummy", latitude: 0, longitude: 0),
            Station(title: "Ленинградский вокзал", type: "dummy", code: "dummy", latitude: 0, longitude: 0)
        ]
    }
    
    // MARK: - Story Mocks
    
    enum Stories {
        
        private static var previewTitle: String {
            Array(repeating: "title", count: 7).joined(separator: " ").capitalized
        }
        
        static let allStories: [Story] = [
            Story(imageName: "preview1", title: previewTitle, storyPages: page1),
            Story(imageName: "preview2", title: previewTitle, storyPages: page2),
            Story(imageName: "preview3", title: previewTitle, storyPages: page3),
            Story(imageName: "preview4", title: previewTitle, storyPages: page4),
            Story(imageName: "preview5", title: previewTitle, storyPages: page5),
            Story(imageName: "preview6", title: previewTitle, storyPages: page6)
        ]
        
        private static var storyTitle: String {
            Array(repeating: "title", count: 7).joined(separator: " ").capitalized
        }
        
        private static var storyDescription: String {
            Array(repeating: "text", count: 20).joined(separator: " ")
        }
        
        static let page1: [StoryPage] = [
            StoryPage(imageName: "big1-1", title: storyTitle, description: storyDescription),
            StoryPage(imageName: "big1-2", title: storyTitle, description: storyDescription)
        ]
        private static let page2: [StoryPage] = [
            StoryPage(imageName: "big2-1", title: storyTitle, description: storyDescription),
            StoryPage(imageName: "big2-2", title: storyTitle, description: storyDescription)
        ]
        private static let page3: [StoryPage] = [
            StoryPage(imageName: "big3-1", title: storyTitle, description: storyDescription),
            StoryPage(imageName: "big3-2", title: storyTitle, description: storyDescription)
        ]
        private static let page4: [StoryPage] = [
            StoryPage(imageName: "big4-1", title: storyTitle, description: storyDescription),
            StoryPage(imageName: "big4-2", title: storyTitle, description: storyDescription)
        ]
        private static let page5: [StoryPage] = [
            StoryPage(imageName: "big5-1", title: storyTitle, description: storyDescription),
            StoryPage(imageName: "big5-2", title: storyTitle, description: storyDescription)
        ]
        private static let page6: [StoryPage] = [
            StoryPage(imageName: "big6-1", title: storyTitle, description: storyDescription),
            StoryPage(imageName: "big6-2", title: storyTitle, description: storyDescription)
        ]
    }
}
