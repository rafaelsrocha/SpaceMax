//
//  NextLaunchScreen.swift
//  SpaceMax
//
//  Created by Rafael Rocha on 19.04.23.
//

import SwiftUI
import Combine

struct NextLaunchScreen: View {
    @StateObject
    private var viewModel: NextLaunchViewModel = NextLaunchViewModel()

    var body: some View {
        NavigationView {
            List {
                if viewModel.anyError.isEmpty {
                    nextLaunchViewComponents
                } else {
                    errorView
                }
            }
            .task {
                await viewModel.fetchNextLaunch()
            }
            .refreshable {
                await viewModel.fetchNextLaunch()
            }
            .listStyle(.plain)
            .navigationTitle("next-launch")
            .background(Color("ScreenBackground"))
        }
    }

    private var nextLaunchViewComponents: some View {
        Group {
            Text(viewModel.missionName)
                .smText(.title)
                .nextLaunchListModifiers()
            NextLaunchCountdown()
                .nextLaunchListModifiers()
                .padding(.bottom)
                .environmentObject(viewModel)
            NextLaunchAddress()
                .nextLaunchListModifiers()
                .listRowInsets(.init(top: 20, leading: 20, bottom: 0, trailing: 20))
                .environmentObject(viewModel)
            HStack(alignment: .top) {
                NextLaunchRocketSpec()
                    .environmentObject(viewModel)
                VStack {
                    NextLaunchWeather()
                    NextLaunchCost(cost: viewModel.launchCost)
                }
                .frame(width: 150)
            }
            .nextLaunchListModifiers()
        }
    }

    private var errorView: some View {
        Group {
            HStack {
                Spacer()
                Image(systemName: "exclamationmark.triangle")
                    .foregroundColor(Color.yellow)
                Text("Oops! Something went wrong.")
                    .smText(.headline)
                    .multilineTextAlignment(.center)
                    .nextLaunchListModifiers()
                Spacer()
            }
            Text(viewModel.anyError)
                .multilineTextAlignment(.center)
                .nextLaunchListModifiers()
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
