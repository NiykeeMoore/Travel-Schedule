//
//  RoutesScreenViewModel.swift
//  Travel Schedule
//
//  Created by Niykee Moore on 04.02.2025.
//


import SwiftUI

@MainActor
final class RoutesScreenViewModel: ObservableObject {
    enum State: Equatable {
        case loading, loaded, none, error
    }
    
    let notification = "Вариантов нет"
    let buttonTitle = "Уточнить время"
    
    @Published var filter = Filter()
    @Published private(set) var state: State = .loading
    @Published private(set) var carriers: [Carrier] = []
    @Published private(set) var currentError: ErrorType = .serverError
    @Published private(set) var destinations: [Destination]
    
    private(set) var routes: [Route]
    private(set) var routesDownloader: RoutesDownloader
    private(set) var imageDownloader: ImageDownloader
    
    // Вычисляемые свойства для заголовка
    var departure: String {
        destinations[JourneyType.departure.rawValue].station.title
    }
    
    var arrival: String {
        destinations[JourneyType.arrival.rawValue].station.title
    }
    
    var filteredRoutes: [Route] {
        // Ваш код фильтрации с корректными строковыми сравнениями
        let complexRoutes = filter.isWithTransfers ? routes : routes.filter { $0.isDirect == true }
        var allRoutes: [Route] = []
        if filter.isAtNight {
            allRoutes += complexRoutes.filter { $0.departureTime.hasPrefix("00") ||
                $0.departureTime.hasPrefix("01") ||
                $0.departureTime.hasPrefix("02") ||
                $0.departureTime.hasPrefix("03") ||
                $0.departureTime.hasPrefix("04") ||
                $0.departureTime.hasPrefix("05") }
        }
        if filter.isMorning {
            allRoutes += complexRoutes.filter { $0.departureTime.hasPrefix("06") ||
                $0.departureTime.hasPrefix("07") ||
                $0.departureTime.hasPrefix("08") ||
                $0.departureTime.hasPrefix("09") ||
                $0.departureTime.hasPrefix("10") ||
                $0.departureTime.hasPrefix("11") }
        }
        if filter.isAfternoon {
            allRoutes += complexRoutes.filter { $0.departureTime.hasPrefix("12") ||
                $0.departureTime.hasPrefix("13") ||
                $0.departureTime.hasPrefix("14") ||
                $0.departureTime.hasPrefix("15") ||
                $0.departureTime.hasPrefix("16") ||
                $0.departureTime.hasPrefix("17") ||
                $0.departureTime.hasPrefix("18") }
        }
        if filter.isEvening {
            allRoutes += complexRoutes.filter { $0.departureTime.hasPrefix("19") ||
                $0.departureTime.hasPrefix("20") ||
                $0.departureTime.hasPrefix("21") ||
                $0.departureTime.hasPrefix("22") ||
                $0.departureTime.hasPrefix("23") }
        }
        return allRoutes.sorted { $0.date < $1.date }
    }
    
    init(
        destinations: [Destination],
        routes: [Route] = [],
        routesDownloader: RoutesDownloader,
        imageDownloader: ImageDownloader
    ) {
        self.destinations = destinations
        self.routes = routes
        self.routesDownloader = routesDownloader
        self.imageDownloader = imageDownloader
    }
    
    // Остальные методы (searchRoutes, convert, и т.д.)
    func searchRoutes() async throws {
        state = .loading
        var segments: [Components.Schemas.Segment] = []
        do {
            segments = try await routesDownloader.fetchData(
                from: destinations[JourneyType.departure.rawValue].station,
                to: destinations[JourneyType.arrival.rawValue].station
            )
        } catch {
            currentError = error.localizedDescription.contains("error 16.") ? .serverError : .connectionError
            state = .error
            throw currentError == .serverError ? ErrorType.serverError : ErrorType.connectionError
        }
        
        // Преобразование сегментов в маршруты...
        var convertedRoutes: [Route] = []
        for segment in segments {
            let hasTransfers = segment.has_transfers ?? false
            if !hasTransfers {
                guard let duration = segment.duration else { continue }
                let uid = segment.thread?.uid ?? "ND"
                let type = segment.from?.transport_type
                guard
                    let carrier = segment.thread?.carrier,
                    let carrierCode = carrier.code else { continue }
                
                if carriers.first(where: { $0.code == Int(carrierCode) }) == nil {
                    convert(from: carrier, for: type?.rawValue ?? "")
                }
                
                let route = Route(
                    code: uid,
                    date: segment.start_date ?? "today",
                    departureTime: (segment.departure ?? "").returnTimeString,
                    arrivalTime: (segment.arrival ?? "").returnTimeString,
                    durationTime: duration.description.getLocalizedDuration,
                    connectionStation: "",
                    carrierCode: Int(carrierCode)
                )
                convertedRoutes.append(route)
            }
        }
        routes = convertedRoutes
        state = routes.isEmpty ? .none : .loaded
    }
    
    func convert(from carrier: Components.Schemas.Carrier, for type: String) {
        var placeholder = ""
        switch type {
        case "plane": placeholder = "airplane.circle"
        case "train", "suburban": placeholder = "cablecar"
        case "water": placeholder = "ferry"
        default: placeholder = "bus.fill"
        }
        let convertedCarrier = Carrier(
            code: Int(carrier.code ?? 0),
            title: carrier.title ?? "ND",
            logoUrl: carrier.logo ?? "",
            logoSVGUrl: carrier.logo_svg ?? "",
            placeholder: placeholder,
            email: carrier.email ?? "",
            phone: carrier.phone ?? "",
            contacts: carrier.contacts ?? ""
        )
        if convertedCarrier.code != 0 {
            carriers.append(convertedCarrier)
        }
    }
}
