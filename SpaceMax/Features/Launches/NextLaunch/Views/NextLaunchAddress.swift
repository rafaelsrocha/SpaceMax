//
//  NextLaunchAddress.swift
//  SpaceMax
//
//  Created by Rafael Rocha on 20.04.23.
//

import SwiftUI

struct NextLaunchAddress: View {
    @EnvironmentObject
    var viewModel: NextLaunchViewModel

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Location").smText(.title3)
                Spacer()
                Text(viewModel.addressData.name)
                    .smText(.headline)
                Spacer()
                Text(viewModel.addressData.address)
                    .smText(.subheadline, foregroundColor: Color("SecondaryFontColor"))
            }
            NextLaunchAddressMap()
                .clipShape(RoundedRectangle(cornerRadius: AppSpecs.sectionCornerRadius))
                .padding(.leading)
                .environmentObject(viewModel)
        }
        .padding()
        .background(Color("SectionBackground"))
        .clipShape(RoundedRectangle(cornerRadius: AppSpecs.sectionCornerRadius))
        .frame(height: 175)
    }
}

struct NextLaunchAddress_Previews: PreviewProvider {
    static var previews: some View {
        NextLaunchAddress()
            .environmentObject(NextLaunchViewModel())
    }
}
