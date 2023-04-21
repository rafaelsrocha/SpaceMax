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
                    .listRowInsets(.init(top: 20, leading: 20, bottom: 0, trailing: 20))
                HStack(alignment: .top) {
                    NextLaunchRocketSpec()
                    VStack {
                        NextLaunchWeather()
                        NextLaunchCost()
                    }
                    .frame(width: 150)
                }
                .nextLaunchListModifiers()
            }
            .listStyle(.plain)
            .navigationTitle("next-launch")
            .background(Color("ScreenBackground"))
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
