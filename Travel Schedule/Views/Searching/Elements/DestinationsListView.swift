//
//  DestinationsListView.swift
//  Travel Schedule
//
//  Created by Niykee Moore on 31.01.2025.
//

import SwiftUI

struct DestinationsListView: View {
    let destinations: [JourneyType: Destination]
    private let dummyDirection = ["Откуда", "Куда"]
    @Binding var directionId: JourneyType

    var body: some View {
        VStack(alignment: .leading, spacing: .zero) {
            ForEach(JourneyType.allCases, id: \.self) { journeyType in
                let destination = destinations[journeyType] ?? Destination()
                let city = destination.cityTitle
                let station = destination.stationTitle.isEmpty ? "" : " (" + destination.stationTitle + ")"
                let dummyText = dummyDirection[journeyType.rawValue]
                let destinationLabel = city.isEmpty ? dummyText : city + station
                
                NavigationLink(value: ViewsRouter.cityView) {
                    HStack {
                        Text(destinationLabel)
                            .foregroundStyle(city.isEmpty ? AppColors.Universal.gray : AppColors.Universal.black)
                        Spacer()
                    }
                    .padding(AppSizes.Spacing.large)
                    .frame(maxWidth: .infinity, maxHeight: AppSizes.Height.searchingRow)
                }
                .simultaneousGesture(TapGesture().onEnded {
                    directionId = journeyType
                })
            }
        }
        .background(AppColors.Universal.white)
        .clipShape(RoundedRectangle(cornerRadius: AppSizes.CornerRadius.xLarge))
    }
}


#Preview {
    VStack {
        DestinationsListView(destinations: Destination.emptyDestinations,
                             directionId: .constant(.departure))
        DestinationsListView(destinations: Destination.sampleData,
                             directionId: .constant(.departure))
    }
    .padding()
    .background(AppColors.Universal.blue)
}
