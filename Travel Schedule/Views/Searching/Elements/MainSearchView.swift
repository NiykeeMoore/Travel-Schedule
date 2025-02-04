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
    @Binding var directionId: JourneyType
    
    var body: some View {
        HStack(alignment: .center, spacing: AppSizes.Spacing.large) {
            DestinationsListView(destinations: schedule.destinations,
                                 directionId: $directionId)
            
            SwapButtonView(destinations: $schedule.destinations)
        }
        .padding(AppSizes.Spacing.large)
        .background(AppColors.Universal.blue)
        .clipShape(RoundedRectangle(cornerRadius: AppSizes.CornerRadius.xLarge))
        .frame(height: AppSizes.Height.searchingForm)
        .padding(.top, AppSizes.Spacing.xLarge)
        .padding(.horizontal, AppSizes.Spacing.large)
        
        SearchButtonView(for: schedule.destinations, showView: ViewsRouter.routeView)
        
        Spacer()
    }
}

#Preview {
    NavigationStack {
        MainSearchView(schedule: .constant(Schedule.sampleData),
                       navPath: .constant([]),
                       directionId: .constant(.departure))
    }
}
