//
//  WeatherResource.swift
//  SpaceMax
//
//  Created by Rafael Rocha on 25.04.23.
//

import Foundation

struct WeatherResource: NetworkResource {
    // MARK: - NetworkResource
    typealias Model = Weather

    var url: URL {
        guard let apikey: String = Bundle.main.infoDictionary?["TOMORROW_IO_API_KEY"] as? String else {
            fatalError("WeatherResource#url: Could not find TOMORROW_IO_API_KEY in Bundle.main")
        }
        let units = "metric"

        var components = URLComponents(string: "https://api.tomorrow.io")!
        components.path = "/v4/weather/realtime"
        components.queryItems = [
            URLQueryItem(name: "location", value: latlng),
            URLQueryItem(name: "apikey", value: apikey),
            URLQueryItem(name: "units", value: units)
        ]

        return components.url!
    }

    // MARK: -
    private var latlng: String = "0,0"

    public init(latitude: Float, longitude: Float) {
        latlng = "\(latitude),\(longitude)"
    }
}
