//
//  NextLaunchRocketSpec.swift
//  SpaceMax
//
//  Created by Rafael Rocha on 19.04.23.
//

import SwiftUI

struct NextLaunchRocketSpec: View {
    @EnvironmentObject
    var viewModel: NextLaunchViewModel

    var body: some View {
        VStack {
            Text(viewModel.rocketSpecData.name)
                .smText(.headline)
                .padding(.vertical)
            HStack {
                Image(viewModel.rocketSpecData.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 120)
                    .padding(.horizontal, 16)
                VStack(alignment: .leading) {
                    NextLaunchRocketSpecItem(type: .height, specValue: viewModel.rocketSpecData.height)
                    NextLaunchRocketSpecItem(type: .mass, specValue: viewModel.rocketSpecData.mass)
                    NextLaunchRocketSpecItem(type: .diameter, specValue: viewModel.rocketSpecData.diameter)
                    NextLaunchRocketSpecItem(type: .payloadMass, specValue: viewModel.rocketSpecData.payloadMass)
                }
                .padding(.trailing)
            }
            .padding(.bottom)
        }
        .frame(maxWidth: .infinity)
        .background(Color("SectionBackground"))
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

struct NextLaunchRocketSpec_Previews: PreviewProvider {
    static var previews: some View {
        NextLaunchRocketSpec()
            .frame(width: 170)
            .environmentObject(NextLaunchViewModel())
    }
}
