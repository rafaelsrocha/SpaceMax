//
//  Weather.swift
//  SpaceMax
//
//  Created by Rafael Rocha on 25.04.23.
//

import Foundation

// swiftlint:disable nesting
/// tomorrow.io realtime weather representation
struct Weather: Decodable {
    let data: Data

    struct Data: Decodable {
        let time: String
        let values: Values

        struct Values: Decodable {
            let temperature: Double
        }
    }
}
// swiftlint:enable nesting
