//
//  RouteView.swift
//  Travel Schedule
//
//  Created by Niykee Moore on 13.01.2025.
//

import SwiftUI

struct RouteView: View {
    let route: Route
    let carrier: Carrier
    
    init(route: Route, carrier: Carrier) {
        self.route = route
        self.carrier = carrier
    }
    
    var body: some View {
        VStack(spacing: .zero) {
            RouteCarrierView(route: route, carrier: carrier)
            RouteTimeView(route: route)
        }
        .background(AppColors.Universal.lightGray)
        .frame(maxWidth: .infinity, maxHeight: AppSizes.Height.route)
        .clipShape(RoundedRectangle(cornerRadius: AppSizes.CornerRadius.xxLarge))
    }
}

#Preview {
    RouteView(route: Schedule.sampleData.routes[0], carrier: Carrier.sampleData[0])
}
