//
//  NextLaunchCountdownTicker.swift
//  SpaceMax
//
//  Created by Rafael Rocha on 20.04.23.
//

import SwiftUI

struct NextLaunchCountdownTicker: View {
    var body: some View {
        VStack {
            Text("13").smText(size: 60)
            Text("days").smText(.title3)
        }
    }
}

struct NextLaunchCountdownTicker_Previews: PreviewProvider {
    static var previews: some View {
        NextLaunchCountdownTicker()
            .background(Color("ScreenBackground"))
    }
}
