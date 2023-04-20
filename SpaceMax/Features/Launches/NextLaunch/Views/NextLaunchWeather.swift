//
//  NextLaunchWeather.swift
//  SpaceMax
//
//  Created by Rafael Rocha on 20.04.23.
//

import SwiftUI

struct NextLaunchWeather: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "cloud.sun.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30)
                    .foregroundColor(.yellow)
                Text("Florida, USA").smText(.subheadline)
            }
            Text("18ºC").smText(size: 44)
        }
        .padding()
        .background(AppTheme.sectionBackground)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

struct NextLaunchWeather_Previews: PreviewProvider {
    static var previews: some View {
        NextLaunchWeather()
            .frame(height: 125)
    }
}
