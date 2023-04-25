//
//  NextLaunchCountdown.swift
//  SpaceMax
//
//  Created by Rafael Rocha on 20.04.23.
//

import SwiftUI

struct NextLaunchCountdown: View {
    @EnvironmentObject
    var viewModel: NextLaunchViewModel

    var body: some View {
        HStack {
            Spacer()
            NextLaunchCountdownTicker(value: viewModel.countdownData.days, unit: .days)
            Spacer()
            NextLaunchCountdownTicker(value: viewModel.countdownData.hours, unit: .hours)
            Spacer()
            NextLaunchCountdownTicker(value: viewModel.countdownData.minutes, unit: .minutes)
            Spacer()
            NextLaunchCountdownTicker(value: viewModel.countdownData.seconds, unit: .seconds)
            Spacer()
        }
    }
}

struct NextLaunchCountdown_Previews: PreviewProvider {
    static var previews: some View {
        NextLaunchCountdown()
            .background(Color("ScreenBackground"))
            .environmentObject(NextLaunchViewModel())
    }
}
