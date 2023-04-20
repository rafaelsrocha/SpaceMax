//
//  NextLaunchRocketSpec.swift
//  SpaceMax
//
//  Created by Rafael Rocha on 19.04.23.
//

import SwiftUI

struct NextLaunchRocketSpec: View {
    var body: some View {
        HStack {
            Image("Falcon9Heavy")
                .resizable()
                .scaledToFit()
                .frame(height: 100)
                .padding(.all, 16)
            VStack(alignment: .leading) {
                NextLaunchRocketSpecItem(type: .height, specValue: "350m")
                NextLaunchRocketSpecItem(type: .mass, specValue: "23295kg")
                    .padding(.vertical, 2)
                NextLaunchRocketSpecItem(type: .diameter, specValue: "30m")
            }
            .padding(.trailing)
        }
        .background(AppTheme.sectionBackground)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

struct NextLaunchRocketSpec_Previews: PreviewProvider {
    static var previews: some View {
        NextLaunchRocketSpec()
            .frame(width: 170)
    }
}
