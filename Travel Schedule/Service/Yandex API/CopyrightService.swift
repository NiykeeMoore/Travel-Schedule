//
//  CopyrightService.swift
//  Travel Schedule
//
//  Created by Niykee Moore on 13.12.2024.
//

typealias CopyrightResponse = Components.Schemas.CopyrightResponse

protocol CopyrightServiceProtocol {
    func getCopyright() async throws -> CopyrightResponse
}

final class CopyrightService: CopyrightServiceProtocol {
    private let client: Client

    init(client: Client) {
        self.client = client
    }
    
    func getCopyright() async throws -> CopyrightResponse {
        let response = try await client.getCopyright()
        
        return try response.ok.body.json
    }
}
