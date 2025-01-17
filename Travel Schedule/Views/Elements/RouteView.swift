//
//  RouteView.swift
//  Travel Schedule
//
//  Created by Niykee Moore on 13.01.2025.
//

import SwiftUI

struct RouteView: View {
    @State private var route: Route
    @State private var carrier: Carrier
    
    init(route: Route, carrier: Carrier) {
        self.route = route
        self.carrier = carrier
    }
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 8) {
                Image(carrier.logoName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 38, height: 38)
                    .padding(.leading, 14)
                HStack(spacing: 0) {
                    VStack(alignment: .leading) {
                        Text(carrier.title)
                            .font(.regMedium)
                            .foregroundStyle(.ccAlwaysBlack)
                        Text("С пересадкой в \(route.connectionStation)")
                            .font(.regSmall)
                            .foregroundStyle(.ccRed)
                            .opacity(route.isDirect ? 0 : 1)
                    }
                    Spacer()
                    Text(route.date)
                        .font(.regSmall)
                        .foregroundStyle(.ccAlwaysBlack)
                }
            }
            .padding(.top, 14)
            .padding(.trailing, 7)
            
            HStack(spacing: 0) {
                Text(route.departureTime)
                    .font(.regMedium)
                    .padding(.trailing, 4)
                    .background(.ccLightGray)
                Spacer()
                Text("\(route.durationTime) часов")
                    .font(.regSmall)
                    .padding(.horizontal, 5)
                    .background(.ccLightGray)
                Spacer()
                Text(route.arrivalTime)
                    .font(.regMedium)
                    .padding(.leading, 4)
                    .background(.ccLightGray)
            }
            .background(
                Rectangle()
                    .frame(height: 1)
                    .foregroundStyle(.ccGray)
            )
            .foregroundStyle(.ccAlwaysBlack)
            .padding(14)
            .frame(maxWidth: .infinity, maxHeight: 48)
        }
        .background(.ccLightGray)
        .frame(maxWidth: .infinity, maxHeight: 104)
        .clipShape(RoundedRectangle(cornerRadius: 24))
    }
}

#Preview {
    RouteView(route: Schedule.sampleData.routes[0], carrier: Carrier.sampleData[0])
}
