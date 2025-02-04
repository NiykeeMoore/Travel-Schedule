//
//  SwarchButtonView.swift
//  Travel Schedule
//
//  Created by Niykee Moore on 29.01.2025.
//

import SwiftUI

struct SearchButtonView: View {
    private let searchButtonTitle = "Найти"
    let destinations: [JourneyType: Destination]
    let route: ViewsRouter
    
    private var isDepartureReady: Bool {
        guard let departure = destinations[.departure] else { return false }
        return !departure.cityTitle.isEmpty && !departure.stationTitle.isEmpty
    }
    
    private var isArrivalReady: Bool {
        guard let arrival = destinations[.arrival] else { return false }
        return !arrival.cityTitle.isEmpty && !arrival.stationTitle.isEmpty
    }
    
    var body: some View {
        if isDepartureReady && isArrivalReady {
            NavigationLink(value: route) {
                ButtonTitleView(title: searchButtonTitle)
                    .setCustomButton(width: AppSizes.Width.searchButton, padding: .all)
            }
        }
    }
    
    init(for destinations: [JourneyType: Destination], showView route: ViewsRouter) {
        self.destinations = destinations
        self.route = route
    }
}

#Preview {
    SearchButtonView(for: Destination.sampleData, showView: ViewsRouter.cityView)
        .background(AppColors.Universal.red.opacity(0.5))
}
