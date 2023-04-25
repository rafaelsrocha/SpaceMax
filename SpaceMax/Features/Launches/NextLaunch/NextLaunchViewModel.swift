//
//  NextLaunchViewModel.swift
//  SpaceMax
//
//  Created by Rafael Rocha on 21.04.23.
//

import SwiftUI
import CoreLocation

typealias NextLaunchData = SpaceX.NextLaunchQuery.Data.LaunchNext

protocol NextLaunchViewModelProtocol {
    func fetchNextLaunch() async
}

/// Countdown data representation for Next Launch screen.
struct NextLaunchCountdownData {
    var days: String
    var hours: String
    var minutes: String
    var seconds: String
}

/// Rocket's specs data representation for Next Launch screen.
struct NextLaunchRocketSpecData {
    var name: String
    var imageName: String
    var height: String
    var mass: String
    var diameter: String
    var payloadMass: String
}

/// Launch address  data representation for Next Launch screen.
struct NextLaunchAddressData {
    var name: String
    var address: String
    var location: CLLocationCoordinate2D
}

// MARK: - Implemetation

@MainActor
class NextLaunchViewModel: NextLaunchViewModelProtocol, ObservableObject {
    private var countdownTimer: NextLaunchCountdownTimer?
    @Published
    private(set) var missionName: String = "–"
    @Published
    private(set) var launchCost: String = "–"
    @Published
    private(set) var countdownData: NextLaunchCountdownData = NextLaunchCountdownData(
        days: "–",
        hours: "–",
        minutes: "–",
        seconds: "–"
    )
    @Published
    private(set) var rocketSpecData: NextLaunchRocketSpecData = NextLaunchRocketSpecData(
        name: "–",
        imageName: "Falcon9Heavy", // Hardcoded while I don't have more images
        height: "–",
        mass: "–",
        diameter: "–",
        payloadMass: "–"
    )
    @Published
    private(set) var addressData: NextLaunchAddressData = NextLaunchAddressData(
        name: "–",
        address: "–",
        location: CLLocationCoordinate2D()
    )
    @Published
    private(set) var launchDayTemperature: Int = 0
    @Published
    private(set) var anyError: String = ""

    /// Queries GraphQL to retrieve NextLaunch's data
    func fetchNextLaunch() async {
        do {
            async let graphQLResult = SpaceXGQL.shared.queryRequest(query: SpaceX.NextLaunchQuery())
            async let weatherResult = fetchWeatherInfo()
            try await dispatch(data: graphQLResult.data, weatherInfo: weatherResult)
        } catch {
            self.anyError = error.localizedDescription
        }
    }

    /// Formats and publishes variables values.
    ///
    /// - Parameters:
    ///   - data: The data retrieved from GrahQL query
    private func dispatch(data: SpaceX.NextLaunchQuery.Data?, weatherInfo: Weather?) async throws {
        guard
            let nextLaunch: NextLaunchData = data?.launchNext,
            let weather: Weather = weatherInfo
        else {
            throw NSError(
                domain: "NextLaunchViewModel#dispatch: Malformed server response",
                code: -1,
                userInfo: [
                    "response.data": data ?? "nil",
                    "weatherInfo": weatherInfo ?? "nil"
                ]
            )
        }

        // Mission name
        missionName = nextLaunch.mission_name ?? "–"
        // Launch day temperature
        launchDayTemperature = Int(weather.data.values.temperature)

        // Cost per launch
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2
        launchCost = formatter.string(for: nextLaunch.rocket?.rocket?.cost_per_launch ?? 0) ?? "–"

        // Countdown data
        if let launchDate = nextLaunch.launch_date_utc {
            let countdownComponents: DateComponents = try launchDate.parseDateComponents(from: Date())
            countdownData = parseCountdownData(fromComponents: countdownComponents)

            if countdownTimer == nil {
                countdownTimer = NextLaunchCountdownTimer(launchDateComponents: countdownComponents)
                countdownTimer?.startCountdown { timerComponents in
                    self.countdownData = self.parseCountdownData(fromComponents: timerComponents)
                }
            }
        }

        // Rocket's specs data
        if let rocket = nextLaunch.rocket?.rocket {
            rocketSpecData = parseRocketSpecData(rocket: rocket)
        }

        // LaunchSite does not return anything useful:
        // https://studio.apollographql.com/public/SpaceX-pxxbxen/variant/current/schema/reference/objects/LaunchSite?query=launchs
        // But Launchpad.Location does:
        // https://studio.apollographql.com/public/SpaceX-pxxbxen/variant/current/schema/reference/objects/Location?query=launchad
        // Unfortunately, none of them are filled in the LaunchNext (Location does not even exist there),
        // so I'll hardcode a location for testing purposes.
        if let newData: NextLaunchAddressData = try? await parseAddressData(latitude: 28.49834, longitude: -80.57366) {
            addressData = newData
        }
    }

    /// Parses the Launch date to NextLaunchCountdownData.
    ///
    /// - Parameters:
    ///   - forDate: The launch date
    ///
    /// - Returns: NextLaunchCountdownData representing how much time is left to rocket's launch.
    private func parseCountdownData(fromComponents components: DateComponents) -> NextLaunchCountdownData {
        var days: String = String(components.day ?? 0)
        var hours: String = String(components.hour ?? 0)
        var minutes: String = String(components.minute ?? 0)
        var seconds: String = String(components.second ?? 0)

        // Add leading 0 if it's only one char
        if days.count < 2 {
            days.insert("0", at: days.startIndex)
        }
        if hours.count < 2 {
            hours.insert("0", at: hours.startIndex)
        }
        if minutes.count < 2 {
            minutes.insert("0", at: minutes.startIndex)
        }
        if seconds.count < 2 {
            seconds.insert("0", at: seconds.startIndex)
        }

        return NextLaunchCountdownData(days: days, hours: hours, minutes: minutes, seconds: seconds)
    }

    /// Parses the Rocket date to NextLaunchRocketSpecData.
    /// Converts masses from kilograms to tons.
    ///
    /// - Parameters:
    ///   - rocket: The rocket to be launched
    ///
    /// - Returns: The rocket's specs.
    private func parseRocketSpecData(rocket: NextLaunchData.Rocket.Rocket) -> NextLaunchRocketSpecData {
        // Convert to tonne
        let mass: Int = (rocket.mass?.kg ?? 0) / 1000
        var payloadMassSum: Int = 0
        if let weights = rocket.payload_weights {
            payloadMassSum = weights.reduce(0) { result, weight in
                result + (weight?.kg ?? 0)
            }
        }
        let payloadMass: Int = payloadMassSum / 1000

        return NextLaunchRocketSpecData(
            name: rocket.name ?? "–",
            imageName: "Falcon9Heavy", // Hardcoded while I don't have more images
            height: String(rocket.height?.meters ?? 0) + "m",
            mass: "\(mass)t",
            diameter: String(rocket.diameter?.meters ?? 0) + "m",
            payloadMass: "\(payloadMass)t"
        )
    }

    /// Parseslatitude and longitude to human-readable location.
    ///
    /// - Parameters:
    ///   - latitude: The launch's location latitude
    ///   - longitude: The launch's location longitude
    ///
    /// - Returns: Human-readable location name address.
    private func parseAddressData(
        latitude: CLLocationDegrees,
        longitude: CLLocationDegrees
    ) async throws -> NextLaunchAddressData {
        guard let placemark: CLPlacemark = try await LocationManager.shared.reverseGeocode(
            forLatitude: latitude,
            longitude: longitude)
        else {
            throw NSError(
                domain: "NextLaunchViewModel#parseAddressData: No CLPlacemark found",
                code: -1,
                userInfo: [
                    "latitude": latitude,
                    "longitude": longitude
                ]
            )
        }
        var address: [String] = []
        if let thoroughfare = placemark.thoroughfare {
            address.append(thoroughfare)
        }
        if let subThoroughfare = placemark.subThoroughfare {
            address.append(subThoroughfare)
        }
        if let locality = placemark.locality {
            address.append(locality)
        }
        if let subLocality = placemark.subLocality {
            address.append(subLocality)
        }
        if let administrativeArea = placemark.administrativeArea {
            address.append(administrativeArea)
        }
        if let subAdministrativeArea = placemark.subAdministrativeArea {
            address.append(subAdministrativeArea)
        }
        if let postalCode = placemark.postalCode {
            address.append(postalCode)
        }

        return NextLaunchAddressData(
            name: placemark.name ?? "–",
            address: address.joined(separator: ", "),
            location: CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        )
    }

    func fetchWeatherInfo() async throws -> Weather? {
        // Also hardcoded given the explanation on line 138
        let resource: WeatherResource = WeatherResource(latitude: 28.49834, longitude: -80.57366)
        return try await NetworkRequest.default.fetch(resource: resource)
    }
}
