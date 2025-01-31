//
//  RouteTimeView.swift
//  Travel Schedule
//
//  Created by Niykee Moore on 31.01.2025.
//


import SwiftUI

struct RouteTimeView: View {
    let route: Route
    var body: some View {
        HStack(spacing: .zero) {
            RouteTimeDetailsView(field: .left, route: route)
            Spacer()
            RouteTimeDetailsView(field: .center, route: route)
            Spacer()
            RouteTimeDetailsView(field: .right, route: route)
        }
        .background(
            Rectangle()
                .frame(height: AppSizes.Line.small)
                .foregroundStyle(AppColors.Universal.gray)
        )
        .foregroundStyle(AppColors.Universal.black)
        .padding(AppSizes.Spacing.medium)
        .frame(maxWidth: .infinity, maxHeight: AppSizes.Height.timeLine)
    }
}


#Preview {
    RouteTimeView(route: Route.sampleData[0])
        .background(AppColors.Universal.lightGray)
}
