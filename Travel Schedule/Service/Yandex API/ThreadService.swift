//
//  ThreadService.swift
//  Travel Schedule
//
//  Created by Niykee Moore on 13.12.2024.
//

typealias StationThreadsResponse = Components.Schemas.StationThreadsResponse

protocol StationThreadServiceProtocol {
    func getThread(uid: String) async throws -> StationThreadsResponse
}

final class StationThreadService: StationThreadServiceProtocol {
    private let client: Client

    init(client: Client) {
        self.client = client
    }
    
    func getThread(uid: String) async throws -> StationThreadsResponse {
        let response = try await client.getThread(query: .init(
            uid: uid
        ))
        
        return try response.ok.body.json
    }
}
