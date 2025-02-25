//
//  RootView.swift
//  Travel Schedule
//
//  Created by Niykee Moore on 13.01.2025.
//

import SwiftUI

struct RootTabView: View {
    // MARK: - Properties
    @State private var isError: Bool = false
    
    /*
     Если устанавливаем @ObservedObject,
     обновление срабатывает только после перехода на экран списка городов и обратно,
     хотя данные загружаются сразу после запуска приложения
     */
    @StateObject var destinationsViewModel: SearchScreenViewModel
    @StateObject var rootViewModel: RootViewModel
    
    // MARK: - Body
    var body: some View {
        NavigationStack(path: $rootViewModel.navPath) {
            TabView {
                searchScreenTab
                settingsScreenTab
            }
            .task {
                do {
                    try rootViewModel.fetchData()
                } catch {
                    isError = true
                }
            }
            .sheet(isPresented: $isError, onDismiss: {
                isError = false
            }, content: {
                errorView
            })
            .accentColor(AppColors.LightDark.black)
            .toolbar(.visible, for: .tabBar)
            .navigationDestination(for: ViewsRouter.self) { pathValue in
                switch pathValue {
                case .cityView: citiesScreen
                case .stationView: stationsScreen
                case .routeView: routesScreen
                }
            }
        }
    }
}

// MARK: - Private Views
private extension RootTabView {
    var searchScreenTab: some View {
        SearchScreen(
            navPath: $rootViewModel.navPath,
            rootViewModel: rootViewModel,
            viewModel: destinationsViewModel
        )
        .tabItem {
            AppImages.Tabs.schedule
        }
    }
    
    var settingsScreenTab: some View {
        SettingsScreen()
            .tabItem {
                AppImages.Tabs.settings
            }
    }
    
    var errorView: some View {
        ErrorView(errorType: rootViewModel.currentError)
    }
    
    var citiesScreen: some View {
        CityScreen(
            navPath: $rootViewModel.navPath,
            destinationsViewModel: destinationsViewModel,
            viewModel: CityScreenViewModel(store: rootViewModel.store)
        )
        .toolbar(.hidden, for: .tabBar)
    }
    
    var stationsScreen: some View {
        StationScreen(
            navPath: $rootViewModel.navPath,
            destinationsViewModel: destinationsViewModel,
            viewModel: StationScreenViewModel(
                store: rootViewModel.store,
                city: destinationsViewModel.destinations[destinationsViewModel.direction.rawValue].city
            )
        )
        .toolbar(.hidden, for: .tabBar)
    }
    
    var routesScreen: some View {
        RoutesScreen(
            viewModel: RoutesScreenViewModel(
                destinations: destinationsViewModel.destinations,
                routesDownloader: rootViewModel.routesDownloader,
                imageDownloader: rootViewModel.imageDownloader
            )
        )
        .toolbar(.hidden, for: .tabBar)
    }
}

#Preview {
    RootTabView(
        destinationsViewModel: SearchScreenViewModel(),
        rootViewModel: RootViewModel(yandexAPIService: YandexAPIService(apikey: YandexAPIConfig.APIKEY))
    )
    .environmentObject(SettingsViewModel(yandexAPIService: YandexAPIService(apikey: YandexAPIConfig.APIKEY)))
}
