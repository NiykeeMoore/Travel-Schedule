//
//  StationsDownloader.swift
//  Travel Schedule
//
//  Created by Niykee Moore on 04.02.2025.
//


actor StationsDownloader {
    private var cache: [Components.Schemas.Settlements] = []
    private let yandexAPIService: YandexAPIServiceProtocol
    
    init(yandexAPIService: YandexAPIServiceProtocol) {
        self.yandexAPIService = yandexAPIService
    }
    
    func fetchData() async throws -> [Components.Schemas.Settlements] {
        guard cache.isEmpty else { return cache }
        let service = YandexAPIService(apikey: YandexAPIConfig.APIKEY)
        let response = try await service.stationsList().getStationsGuide()
        guard let countries = response.countries else { throw ErrorType.serverError }
        countries.forEach {
            $0.regions?.forEach {
                $0.settlements?.forEach { settlement in
                    cache.append(settlement)
                }
            }
        }
        return cache
    }
}
