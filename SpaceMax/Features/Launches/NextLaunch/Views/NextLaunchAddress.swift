//
//  NextLaunchAddress.swift
//  SpaceMax
//
//  Created by Rafael Rocha on 20.04.23.
//

import SwiftUI

struct NextLaunchAddress: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Location").smText(.title3)
                Spacer()
                Text("Kennedy Space Center").smText(.headline)
                Spacer()
                Text("Space Commerce Way, Merritt Island, FL 32953, USA").smText(.subheadline, foregroundColor: AppTheme.secondaryFontColor)
            }
            NextLaunchAddressMap()
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .padding(.leading)
        }
        .padding()
        .background(AppTheme.sectionBackground)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .frame(height: 175)
    }
}

struct NextLaunchAddress_Previews: PreviewProvider {
    static var previews: some View {
        NextLaunchAddress()
            .background(AppTheme.screenBackground)
    }
}
