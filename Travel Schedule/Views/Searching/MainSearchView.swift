//
//  MainSearchView.swift
//  Travel Schedule
//
//  Created by Niykee Moore on 13.01.2025.
//

import SwiftUI

struct MainSearchView: View {
    @Binding var schedule: Schedule
    @Binding var navPath: [ViewsRouter]
    @Binding var direction: Int
    private let dummyDirection = ["Откуда", "Куда"]
    
    private var isDepartureReady: Bool {
        !schedule.destinations[.departure].cityTitle.isEmpty && !schedule.destinations[.departure].stationTitle.isEmpty
    }
    
    private var isArrivalReady: Bool {
        !schedule.destinations[.arrival].cityTitle.isEmpty && !schedule.destinations[.arrival].stationTitle.isEmpty
    }
    
    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            VStack(alignment: .leading, spacing: 0) {
                ForEach(0 ..< 2) { item in
                    let isCityEmpty = schedule.destinations[item].cityTitle.isEmpty
                    let isStationEmpty = schedule.destinations[item].stationTitle.isEmpty
                    let destinationLabel = isCityEmpty ? dummyDirection[item] : schedule.destinations[item].cityTitle
                    + (isStationEmpty ? "" : " (" + schedule.destinations[item].stationTitle + ")")
                    NavigationLink(value: ViewsRouter.cityView) {
                        HStack {
                            Text(destinationLabel)
                                .foregroundStyle(schedule.destinations[item].cityTitle.isEmpty ? .ccGray : .ccAlwaysBlack)
                            Spacer()
                        }
                        .padding(.spacerL)
                        .frame(maxWidth: .infinity, maxHeight: 48)
                    }
                    .simultaneousGesture(TapGesture().onEnded {
                        direction = item
                    })
                }
            }
            .background(.ccAlwaysWhite)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            
            ZStack {
                Circle()
                    .foregroundColor(.ccAlwaysWhite)
                    .frame(width: 36)
                Button {
                    (schedule.destinations[.departure], schedule.destinations[.arrival]) =
                    (schedule.destinations[.arrival], schedule.destinations[.departure])
                } label: {
                    Image(systemName: "arrow.2.squarepath")
                        .foregroundColor(.ccBlue)
                }
            }
        }
        .padding(.spacerL)
        .background(.ccBlue)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .frame(height: 128)
        .padding(.top, .spacerXL)
        .padding(.horizontal, .spacerL)
        
        if isDepartureReady && isArrivalReady {
            NavigationLink(value: ViewsRouter.routeView) {
                Text("Найти")
                    .font(.boldSmall)
                    .foregroundStyle(.ccAlwaysWhite)
                    .frame(width: 150, height: 60)
                    .background(.ccBlue)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .padding(.spacerL)
            }
        }
        Spacer()
    }
}

#Preview {
    NavigationStack {
        MainSearchView(schedule: .constant(Schedule.sampleData), navPath: .constant([]), direction: .constant(0))
    }
}
