//
//  YandexRaspService.swift
//  TravelSchedule
//
//  Created by Сергей Махленко on 10.03.2024.
//

import Foundation
import OpenAPIURLSession

protocol YandexAPIServiceProtocol {
    func search() async throws -> SearchServiceProtocol
    func schedule() async throws -> ScheduleServiceProtocol
    func thread() async throws -> StationThreadServiceProtocol
    func nearestStations() async throws -> NearestStationsServiceProtocol
    func nearestSettlement() async throws -> NearestSettlementServiceProtocol
    func carrier() async throws -> CarrierServiceProtocol
    func stationsList() async throws -> StationsListServiceProtocol
    func copyright() async throws -> CopyrightServiceProtocol
}

final class YandexAPIService: YandexAPIServiceProtocol {
    private let apikey: String

    private var client: Client {
        let authenticationMiddleware = AuthenticationMiddleware(apikey: self.apikey)
        let logRequestMiddleware = LogRequestMiddleware()

        let client = Client(
            serverURL: try! Servers.Server1.url(),
            transport: URLSessionTransport(),
            middlewares: [authenticationMiddleware, logRequestMiddleware]
        )

        return client
    }

    init(apikey: String) {
        self.apikey = apikey
    }

    func search() async throws -> SearchServiceProtocol {
        SearchService(client: client)
    }
    
    func schedule() async throws -> ScheduleServiceProtocol {
        ScheduleService(client: client)
    }
    
    func thread() async throws -> StationThreadServiceProtocol {
        StationThreadService(client: client)
    }
    
    func nearestStations() async throws -> NearestStationsServiceProtocol {
        NearestStationsService(client: client)
    }
    
    func nearestSettlement() async throws -> NearestSettlementServiceProtocol {
        NearestSettlementService(client: client)
    }
    
    func carrier() async throws -> CarrierServiceProtocol {
        CarrierService(client: client)
    }
    
    func stationsList() async throws -> StationsListServiceProtocol {
        StationsListService(client: client)
    }
    
    func copyright() async throws -> CopyrightServiceProtocol {
        CopyrightService(client: client)
    }
}
