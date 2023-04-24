//
//  String+SpaceMax.swift
//  SpaceMax
//
//  Created by Rafael Rocha on 23.04.23.
//

import Foundation

extension String {
    /// Formats the date string to Date components and computes its difference to the current Date.
    ///
    /// - Returns: A tuple containing days, hours, minutes and seconds to count down to the Launch date.
    public func toLaunchCountdownComponents() throws -> (days: Int, hours: Int, minutes: Int, seconds: Int) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        guard let formattedLaunchDate = formatter.date(from: self) else {
            throw NSError(
                domain: "String#toLaunchCountdownComponents: Could not format string to launch date.",
                code: -1,
                userInfo: [
                    "string": self,
                    "dateFormat" : formatter.dateFormat ?? "nil"
                ]
            )
        }

        // This is a hack, because the SpaceX API isn't updated with the most recent data.
        // So we add 1 year here for the sake of showing the countdown feature.
        // This is not the best place for it but, since it's a hack, it should not even exist.
        var dateComponent = DateComponents()
        dateComponent.year = 1
        guard let futureLaunchDate = Calendar.current.date(byAdding: dateComponent, to: formattedLaunchDate) else {
            throw NSError(
                domain: "String#toLaunchCountdownComponents: Could not add year to string",
                code: -1,
                userInfo: [
                    "string": self,
                    "dateFormat" : formatter.dateFormat ?? "nil"
                ]
            )
        }

        let dateComponents = Calendar.current.dateComponents(
            [.day, .hour, .minute, .second],
            from: Date(),
            to: futureLaunchDate
        )

        return (
            days: dateComponents.day ?? 0,
            hours: dateComponents.hour ?? 0,
            minutes: dateComponents.minute ?? 0,
            seconds: dateComponents.second ?? 0
        )
    }
}
