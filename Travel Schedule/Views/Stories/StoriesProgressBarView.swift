//
//  StoriesProgressBarView.swift
//  Travel Schedule
//
//  Created by Niykee Moore on 31.01.2025.
//

import SwiftUI
import Combine

struct StoriesProgressBarView: View {
    // MARK: - Constants
    let pagesCount: Int
    let timerConfiguration: TimerConfiguration
    
    // MARK: - Properties
    @Binding var progress: CGFloat
    @State private var timer: Timer.TimerPublisher
    @State private var cancelable: Cancellable?
    
    // MARK: - View
    var body: some View {
        ProgressBarView(numberOfSections: pagesCount, progress: progress)
            .padding(.top, AppSizes.Spacing.Custom.progressBar)
            .padding(.horizontal, AppSizes.Spacing.small)
            .onAppear {
                timer = Self.createTimer(configuration: timerConfiguration)
                cancelable = timer.connect()
            }
            .onDisappear {
                cancelable?.cancel()
            }
            .onReceive(timer) { _ in
                withAnimation {
                    progress = timerConfiguration.nextProgress(progress: progress)
                }
            }
    }
    
    // MARK: - Inits
    init(pagesCount: Int, timerConfiguration: TimerConfiguration, progress: Binding<CGFloat>) {
        self.pagesCount = pagesCount
        self.timerConfiguration = timerConfiguration
        self._progress = progress
        self.timer = Self.createTimer(configuration: timerConfiguration)
    }
}

// MARK: - Private methods
private extension StoriesProgressBarView {
    static func createTimer(configuration: TimerConfiguration) -> Timer.TimerPublisher {
        Timer.publish(every: configuration.timerTickInternal, on: .main, in: .common)
    }
}

#Preview {
    StoriesProgressBarView(
        pagesCount: 3,
        timerConfiguration: TimerConfiguration(pagesCount: 3),
        progress: .constant(0.5)
    )
    .background(
        AppColors.Universal.red.opacity(0.5)
    )
}
