//
//  NextLaunchAddressMap.swift
//  SpaceMax
//
//  Created by Rafael Rocha on 20.04.23.
//

import SwiftUI
import MapKit

struct NextLaunchAddressMap: View {
    @EnvironmentObject
    var viewModel: NextLaunchViewModel
    @State
    private var region = MKCoordinateRegion()

    var body: some View {
        Map(coordinateRegion: $region)
            .onChange(of: viewModel.addressData.location.latitude) { _ in
                setRegion(viewModel.addressData.location)
            }
            .onChange(of: viewModel.addressData.location.longitude) { _ in
                setRegion(viewModel.addressData.location)
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
            .environmentObject(NextLaunchViewModel())
    }
}
