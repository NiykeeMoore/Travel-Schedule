//
//  TravelViewModel.swift
//  Travel Schedule
//
//  Created by Niykee Moore on 04.02.2025.
//


import Foundation

@MainActor
final class TravelViewModel: ObservableObject {
    @Published var copyrightInfo = ""
    @Published private(set) var cities: [City] = []
    @Published private(set) var stations: [Station] = []
    @Published private(set) var countries: [Components.Schemas.Countries] = []
    @Published private(set) var state: State = .loading
    
    private let yandexAPIService: YandexAPIServiceProtocol
    private var store: Components.Schemas.StationsResponse?
    
    init(yandexAPIService: YandexAPIServiceProtocol) {
        self.yandexAPIService = yandexAPIService
        Task {
            await loadData()
        }
    }
    
    func getCopyright() async {
        do {
            let copyrightService = try await yandexAPIService.copyright()
            let response = try await copyrightService.getCopyright()
            copyrightInfo = response.copyright?.text ?? "Ошибка получения копирайта"
        } catch {
            print("Ошибка в getCopyright: \(error.localizedDescription)")
            state = .error(.connectionError)
        }
    }
    
    func fetchData() async {
        do {
            state = .loading
            let service = try await yandexAPIService.stationsList()
            let stationsResponse = try await service.getStationsGuide()
            store = stationsResponse
            print(stationsResponse)
            state = .loaded
        } catch {
            print("Ошибка в fetchData: \(error.localizedDescription)")
            state = .error(.connectionError)
        }
    }
    
    func fetchCities() {
        Task {
            state = .loading
            var newList: [City] = []
            guard
                let store,
                let countries = store.countries else { return }
            countries.forEach {
                $0.regions?.forEach {
                    $0.settlements?.forEach { settlement in
                        guard
                            let settlementTitle = settlement.title,
                            let settlementCodes = settlement.codes,
                            let yandexCode = settlementCodes.yandex_code,
                            let settlementStations = settlement.stations else { return }
                        newList.append(
                            City(
                                title: settlementTitle,
                                yandexCode: yandexCode,
                                stationsCount: settlementStations.count
                            )
                        )
                    }
                }
            }
            cities = newList.sorted { $0.stationsCount > $1.stationsCount }
            state = .loaded
        }
    }
    
    private func loadData() async {
        async let copyrightCall: Void = getCopyright()
        async let fetchCall: Void = fetchData()
        _ = await (copyrightCall, fetchCall)
    }
}

extension TravelViewModel {
    enum State: Equatable {
        case loading,
             loaded,
             error(ErrorType)
    }
}
