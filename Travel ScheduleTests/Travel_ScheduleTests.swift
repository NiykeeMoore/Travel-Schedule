//
//  Travel_ScheduleTests.swift
//  Travel ScheduleTests
//
//  Created by Niykee Moore on 14.12.2024.
//

import XCTest
@testable import Travel_Schedule

final class Travel_ScheduleTests: XCTestCase {
    private let services = YandexAPIService(apikey: YandexAPIConfig.APIKEY)
    
    func testSearch() async throws {
        let searchResult = try await services.search().getSearch(from: "c239", to: "c213")
        XCTAssertNoThrow(searchResult)
    }
    
    func testSchedule() async throws {
        let sheduleResult = try await services.schedule().getSchedule(station_code: "s9600216")
        XCTAssertNoThrow(sheduleResult)
    }
    
    func testFetchThread() async throws {
        let threadResult = try await services.thread().getThread(uid: "028S_27_2")
        XCTAssertNoThrow(threadResult)
    }
    
    func testFetchNearestStation() async throws {
        let nearestStationResult = try await services.nearestStations().getNearestStations(lat: 59.939095, lng: 30.315868, distance: 20)
        XCTAssertNoThrow(nearestStationResult)
    }
    
    func testFetchNearestSettlement() async throws {
        let nearestSettlementResult = try await services.nearestSettlement().getNearestSettlement(lat: 59.939095, lng: 30.315868)
        XCTAssertNoThrow(nearestSettlementResult)
    }
    
    func testFetchCarrier() async throws {
        let carrierResult = try await services.carrier().getCarrier(carrier_code: "8565")
        XCTAssertNoThrow(carrierResult)
    }
    
    func testFetchCopyright() async throws {
        let copyrightResult = try await services.copyright().getCopyright()
        XCTAssertNoThrow(copyrightResult)
    }
    
    func testFetchStationList() async throws {
        let stationListResult = try await services.stationsList().getStationsGuide()
        XCTAssertNoThrow(stationListResult)
    }
}
