//
//  NextLaunchCountdownTicker.swift
//  SpaceMax
//
//  Created by Rafael Rocha on 20.04.23.
//

import SwiftUI

struct NextLaunchCountdownTicker: View {
    enum Unit {
        case days
        case hours
        case minutes
        case seconds

        var raw: String {
            String(describing: self)
        }
    }

    var value: String
    var unit: Unit

    var body: some View {
        VStack {
            Text(value).smText(size: 50)
            Text(unit.raw).smText(.title3)
        }
    }
}

struct NextLaunchCountdownTicker_Previews: PreviewProvider {
    static var previews: some View {
        NextLaunchCountdownTicker(value: "13", unit: .days)
            .background(Color("ScreenBackground"))
    }
}
