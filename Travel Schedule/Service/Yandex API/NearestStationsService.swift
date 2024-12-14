//
//  NearestSettlementService.swift
//  Travel Schedule
//
//  Created by Niykee Moore on 13.12.2024.
//

typealias NearestStationsResponse = Components.Schemas.NearestStationsResponse

protocol NearestStationsServiceProtocol {
    func getNearestStations(lat: Double, lng: Double, distance: Int) async throws -> NearestStationsResponse
}

final class NearestStationsService: NearestStationsServiceProtocol {
    private let client: Client

    init(client: Client) {
        self.client = client
    }
    
    func getNearestStations(lat: Double, lng: Double, distance: Int) async throws -> NearestStationsResponse {
        let response = try await client.getNearestStations(query: .init(
            lat: lat,
            lng: lng,
            distance: distance
        ))
        
        return try response.ok.body.json
    }
}
