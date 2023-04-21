//
//  NextLaunchRocketSpec.swift
//  SpaceMax
//
//  Created by Rafael Rocha on 19.04.23.
//

import SwiftUI

struct NextLaunchRocketSpec: View {
    var body: some View {
        VStack {
            Text("Falcon Heavy")
                .smText(.headline)
                .padding(.vertical)
            HStack {
                Image("Falcon9Heavy")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 120)
                    .padding(.horizontal, 16)
                VStack(alignment: .leading) {
                    NextLaunchRocketSpecItem(type: .height, specValue: "350m")
                    NextLaunchRocketSpecItem(type: .mass, specValue: "1420 T")
                    NextLaunchRocketSpecItem(type: .diameter, specValue: "30m")
                    NextLaunchRocketSpecItem(type: .payloadMass, specValue: "03294Kg")
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
    }
}
