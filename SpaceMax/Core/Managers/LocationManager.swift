//
//  LocationManager.swift
//  SpaceMax
//
//  Created by Rafael Rocha on 23.04.23.
//

import Foundation
import CoreLocation

/// Manages CoreLocation operations, i.e.:
///   - User location permission
///   - Reverse Geocode
struct LocationManager {
    static let shared = LocationManager()
    
    private init() {}
    
    public func reverseGeocode(forLatitude latitude: CLLocationDegrees, longitude: CLLocationDegrees) async throws -> CLPlacemark? {
        let location: CLLocation = CLLocation(latitude: latitude, longitude: longitude)
        let placemarks: [CLPlacemark] = try await CLGeocoder().reverseGeocodeLocation(location)
        return placemarks.first
    }
}
