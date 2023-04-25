//
//  NextLaunchCost.swift
//  SpaceMax
//
//  Created by Rafael Rocha on 21.04.23.
//

import SwiftUI

struct NextLaunchCost: View {
    var cost: String

    var body: some View {
        VStack {
            Text("launch-cost")
                .smText(.headline)
            Text(cost)
                .smText()
                .padding(.top, 1)
                .minimumScaleFactor(0.3)
                .lineLimit(1)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color("SectionBackground"))
        .clipShape(RoundedRectangle(cornerRadius: AppSpecs.sectionCornerRadius))
    }
}

struct NextLaunchCost_Previews: PreviewProvider {
    static var previews: some View {
        NextLaunchCost(cost: "$ 90000000")
            .background(Color("SectionBackground"))
    }
}
