//
//  NextLaunchCountdownTimer.swift
//  SpaceMax
//
//  Created by Rafael Rocha on 24.04.23.
//

import Foundation

class NextLaunchCountdownTimer {
    private var timer: Timer?
    private var remainingTime: Int = 0

    /// Initialize the class object and calculates the remaining time to launch.
    ///
    /// - Parameters:
    ///   - launchDateComponents: DateComponents from the Launch date.
    init(launchDateComponents: DateComponents) {
        let day = launchDateComponents.day ?? 0
        let hour = launchDateComponents.hour ?? 0
        let minute = launchDateComponents.minute ?? 0
        let second = launchDateComponents.second ?? 0

        if day > 0 || hour > 0 || minute > 0 || second > 0 {
            // Convert days to seconds
            remainingTime = day * 86400
            // Convert hours to seconds
            remainingTime += hour * 3600
            // Convert minutes to seconds
            remainingTime += minute * 60
            // Add seconds
            remainingTime += second
        }
    }

    /// Start the countdown timer to reflect it on NextLaunchScreen.
    ///
    /// - Parameters:
    ///   - onTick: Closure receiving the DateComponents to be presented
    func startCountdown(onTick: @escaping (DateComponents) -> Void) {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
            guard let self = self else { return }

            self.remainingTime -= 1
            onTick(self.remaingTimeComponents)

            if self.remainingTime == 0 {
                self.stopCountdown()
            }
        }
    }

    /// Stops and releases timer
    func stopCountdown() {
        timer?.invalidate()
        timer = nil
    }

    private var remaingTimeComponents: DateComponents {
        var currentCalendar = Calendar.current
        // The app is using UTC time, so this is needed to keep consistency.
        if let timezone = TimeZone(secondsFromGMT: 0) {
            currentCalendar.timeZone = timezone
        }

        // Add remaining time to current date
        var dateComponent = DateComponents()
        dateComponent.second = remainingTime
        guard let futureDate = currentCalendar.date(byAdding: dateComponent, to: Date()) else {
            dateComponent.second = 0
            return dateComponent
        }

        // Compute difference between dates
        return currentCalendar.dateComponents(
            [.day, .hour, .minute, .second],
            from: Date(),
            to: futureDate
        )
    }
}
