//
//  RootViewModel.swift
//  Travel Schedule
//
//  Created by Niykee Moore on 04.02.2025.
//


import SwiftUI

@MainActor
final class RootViewModel: ObservableObject {
    enum State: Equatable {
        case loading, loaded, error
    }
    
    @Published private(set) var state: State = .loading
    @Published private(set) var currentError: ErrorType = .serverError
    @Published var navPath: [ViewsRouter] = []
    @Published private(set) var store: [Components.Schemas.Settlements] = []
    
    private let yandexAPIService: YandexAPIService
    private(set) var stationsDownloader: StationsDownloader
    private(set) var routesDownloader: RoutesDownloader
    private(set) var imageDownloader: ImageDownloader
    
    init(
        yandexAPIService: YandexAPIService
    ) {
        self.yandexAPIService = yandexAPIService
        self.stationsDownloader = StationsDownloader(yandexAPIService: yandexAPIService)
        self.routesDownloader = RoutesDownloader(yandexAPIService: yandexAPIService)
        self.imageDownloader = ImageDownloader()
    }
    
    func fetchData() throws {
        Task {
            state = .loading
            do {
                store = try await stationsDownloader.fetchData()
                state = .loaded
            } catch {
                currentError = error.localizedDescription.contains("error 0.") ? .serverError : .connectionError
                state = .error
                throw currentError == .serverError ? ErrorType.serverError : ErrorType.connectionError
            }
        }
    }
}
