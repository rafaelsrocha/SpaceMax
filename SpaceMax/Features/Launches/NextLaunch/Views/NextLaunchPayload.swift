//
//  NextLaunchPayload.swift
//  SpaceMax
//
//  Created by Rafael Rocha on 20.04.23.
//

import SwiftUI

struct NextLaunchPayload: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Payload 1st Stage").smText(.footnote)
                Text("983123 Kg").smText()
            }
            Spacer()
            VStack(alignment: .leading) {
                Text("Payload 2nd Stage").smText(.footnote)
                Text("983123 Kg").smText()
            }
            Spacer()
            VStack(alignment: .leading) {
                Text("Total Payload").smText(.footnote)
                Text("2").smText()
            }
        }
        .padding()
        .background(Color("SectionBackground"))
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

struct NextLaunchPayload_Previews: PreviewProvider {
    static var previews: some View {
        NextLaunchPayload()
    }
}
