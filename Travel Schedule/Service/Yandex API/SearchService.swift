//
//  SearchService.swift
//  Travel Schedule
//
//  Created by Niykee Moore on 13.12.2024.
//

typealias SearchResponse = Components.Schemas.SearchResponse

protocol SearchServiceProtocol {
    func getSearch(from: String, to: String) async throws -> SearchResponse
}

final class SearchService: SearchServiceProtocol {
    private let client: Client

    init(client: Client) {
        self.client = client
    }
    
    func getSearch(from: String, to: String) async throws -> SearchResponse {
        let response = try await client.getSearch(query: .init(
            from: from,
            to: to
        ))
        
        return try response.ok.body.json
    }
}
