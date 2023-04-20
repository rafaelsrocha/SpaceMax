//
//  NextLaunchScreen.swift
//  SpaceMax
//
//  Created by Rafael Rocha on 19.04.23.
//

import SwiftUI

struct NextLaunchScreen: View {
    var body: some View {
        NavigationView {
            List {
                Text("Starlink 450")
                    .smText(.title)
                    .nextLaunchListModifiers()
                NextLaunchCountdown()
                    .nextLaunchListModifiers()
                    .padding(.bottom)
                NextLaunchAddress()
                    .nextLaunchListModifiers()
                HStack(alignment: .top) {
                    NextLaunchRocketSpec()
                    Spacer()
                    NextLaunchWeather()
                }
                .nextLaunchListModifiers()
                NextLaunchPayload()
                    .nextLaunchListModifiers()
            }
            .listStyle(.plain)
            .navigationTitle("next-launch")
            .background(AppTheme.screenBackground)
        }
    }
}

struct NextLaunchScreen_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone 14 Pro", "iPhone SE (3rd generation)", "iPhone 14 Pro Max"], id: \.self) { deviceName in
            NextLaunchScreen()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
