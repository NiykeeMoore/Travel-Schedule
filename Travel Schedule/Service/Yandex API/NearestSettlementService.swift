//
//  NearestSettlementService.swift
//  Travel Schedule
//
//  Created by Niykee Moore on 13.12.2024.
//

typealias NearestSettlementResponse = Components.Schemas.NearestSettlementResponse

protocol NearestSettlementServiceProtocol: Sendable {
    func getNearestSettlement(lat: Double, lng: Double) async throws -> NearestSettlementResponse
}

actor NearestSettlementService: NearestSettlementServiceProtocol {
    private let client: Client

    init(client: Client) {
        self.client = client
    }
    
    func getNearestSettlement(lat: Double, lng: Double) async throws -> NearestSettlementResponse {
        let response = try await client.getNearestSettlement(query: .init(
            lat: lat,
            lng: lng
        ))
        
        return try response.ok.body.json
    }
}
