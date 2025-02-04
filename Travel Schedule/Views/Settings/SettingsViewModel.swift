//
//  SettingsViewModel.swift
//  Travel Schedule
//
//  Created by Niykee Moore on 04.02.2025.
//

import SwiftUI

@MainActor
final class SettingsViewModel: ObservableObject {
    @AppStorage("DarkMode") var darkMode: Bool = false {
        willSet {
            objectWillChange.send()
        }
    }
    @Published var copyrightInfo = String()

    enum Titles {
        static let darkMode = "Тёмная тема"
        static let agreement = "Пользовательское соглашение"
        static let version = "Версия \(Bundle.main.appVersionLong).\(Bundle.main.appBuild)"
    }

    private let yandexAPIService: YandexAPIService

    init(yandexAPIService: YandexAPIService) {
        self.yandexAPIService = yandexAPIService
        self.getCopyright()
    }

    func getCopyright() {
        Task {
            let service = try await yandexAPIService.copyright()
            do {
                let response = try await service.getCopyright()
                copyrightInfo = response.copyright?.text ?? ""
            } catch {
                throw ErrorType.connectionError
            }
        }
    }
}
