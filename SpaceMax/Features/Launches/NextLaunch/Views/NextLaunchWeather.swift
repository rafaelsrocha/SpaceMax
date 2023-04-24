//
//  NextLaunchWeather.swift
//  SpaceMax
//
//  Created by Rafael Rocha on 20.04.23.
//

import SwiftUI

struct NextLaunchWeather: View {
    var body: some View {
        VStack {
            Text("Florida, USA").smText(.subheadline)
            HStack {
                Image(systemName: "cloud.sun.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30)
                    .foregroundColor(.yellow)
                Text("18ºC").smText(size: 36)
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color("SectionBackground"))
        .clipShape(RoundedRectangle(cornerRadius: AppSpecs.sectionCornerRadius))
    }
}

struct NextLaunchWeather_Previews: PreviewProvider {
    static var previews: some View {
        NextLaunchWeather()
            .frame(height: 125)
    }
}
