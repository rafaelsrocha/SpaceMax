//
//  NextLaunchAddressMap.swift
//  SpaceMax
//
//  Created by Rafael Rocha on 20.04.23.
//

import SwiftUI
import MapKit

struct NextLaunchAddressMap: View {
    var coordinate: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868)
    
    @State private var region = MKCoordinateRegion()
    
    var body: some View {
        Map(coordinateRegion: $region)
            .onAppear {
                setRegion(coordinate)
            }
    }
    
    private func setRegion(_ coordinate: CLLocationCoordinate2D) {
        region = MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        )
    }
}

struct NextLaunchAddressMap_Previews: PreviewProvider {
    static var previews: some View {
        NextLaunchAddressMap()
    }
}
