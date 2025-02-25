//
//  RoutesDownloader.swift
//  Travel Schedule
//
//  Created by Niykee Moore on 04.02.2025.
//

import Foundation

actor RoutesDownloader {
    private let yandexAPIService: YandexAPIService

    init(yandexAPIService: YandexAPIService) {
        self.yandexAPIService = yandexAPIService
    }

    func fetchData(from departure: Station, to arrival: Station) async throws -> [Components.Schemas.Segment] {
        let response = try await yandexAPIService.search().getSearch(from: departure.code, to: arrival.code)
        guard let segments = response.segments else { throw ErrorType.serverError }
        return segments
    }
}
