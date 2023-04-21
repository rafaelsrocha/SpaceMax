//
//  NextLaunchCost.swift
//  SpaceMax
//
//  Created by Rafael Rocha on 21.04.23.
//

import SwiftUI

struct NextLaunchCost: View {
    var body: some View {
        VStack {
            Text("Launch cost")
                .smText(.headline)
            Text("$ 90 million")
                .smText()
                .padding(.top, 1)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color("SectionBackground"))
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

struct NextLaunchCost_Previews: PreviewProvider {
    static var previews: some View {
        NextLaunchCost()
            .background(Color("SectionBackground"))
    }
}
