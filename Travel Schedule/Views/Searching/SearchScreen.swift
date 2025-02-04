//
//  SearchTabView.swift
//  Travel Schedule
//
//  Created by Niykee Moore on 13.01.2025.
//

import SwiftUI

struct SearchScreen: View {
    @Binding var navPath: [ViewsRouter]
    @ObservedObject var rootViewModel: RootViewModel
    @ObservedObject var viewModel: SearchScreenViewModel

    var body: some View {
        VStack(spacing: .zero) {
            PreviewStoriesView()
            MainSearchView(
                navPath: $navPath,
                rootViewModel: rootViewModel,
                viewModel: viewModel
            )
            Spacer()
        }
    }
}

#Preview {
    NavigationStack {
        SearchScreen(
            navPath: .constant([]),
            rootViewModel: RootViewModel(yandexAPIService: YandexAPIService(apikey: YandexAPIConfig.APIKEY)),
            viewModel: SearchScreenViewModel()
        )
    }
}
