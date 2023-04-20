//
//  NextLaunchCountdown.swift
//  SpaceMax
//
//  Created by Rafael Rocha on 20.04.23.
//

import SwiftUI

struct NextLaunchCountdown: View {
    var body: some View {
        HStack {
            Spacer()
            NextLaunchCountdownTicker()
            Spacer()
            NextLaunchCountdownTicker()
            Spacer()
            NextLaunchCountdownTicker()
            Spacer()
            NextLaunchCountdownTicker()
            Spacer()
        }
    }
}

struct NextLaunchCountdown_Previews: PreviewProvider {
    static var previews: some View {
        NextLaunchCountdown()
            .background(Color("ScreenBackground"))
    }
}
