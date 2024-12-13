//
//  ScheduleService.swift
//  Travel Schedule
//
//  Created by Niykee Moore on 13.12.2024.
//

typealias ScheduleResponse = Components.Schemas.ScheduleResponse

protocol ScheduleServiceProtocol {
    func getSchedule(station_code: String) async throws -> ScheduleResponse
}

final class ScheduleService: ScheduleServiceProtocol {
    private let client: Client

    init(client: Client) {
        self.client = client
    }
    
    func getSchedule(station_code: String) async throws -> ScheduleResponse {
        let response = try await client.getSchedule(query: .init(
            station: station_code
        ))
        
        return try response.ok.body.json
    }
}
