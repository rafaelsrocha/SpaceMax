//
//  NextLaunchWeather.swift
//  SpaceMax
//
//  Created by Rafael Rocha on 20.04.23.
//

import SwiftUI

struct NextLaunchWeather: View {
    var temperature: Int

    var body: some View {
        VStack {
            Text("Florida, USA").smText(.subheadline)
            HStack {
                Image(systemName: temperatureData.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30)
                    .foregroundColor(temperatureData.imageColor)
                Text("\(temperature)ºC").smText(size: 36)
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color("SectionBackground"))
        .clipShape(RoundedRectangle(cornerRadius: AppSpecs.sectionCornerRadius))
    }

    private var temperatureData: (imageName: String, imageColor: Color) {
        if temperature < 8 {
            return (imageName: "snowflake.circle", imageColor: .blue)
        } else if temperature < 16 {
            return (imageName: "smoke.circle", imageColor: .gray)
        } else if temperature < 23 {
            return (imageName: "cloud.sun.circle", imageColor: .cyan)
        }
        return (imageName: "sun.max.circle", imageColor: .yellow)
    }
}

struct NextLaunchWeather_Previews: PreviewProvider {
    static var previews: some View {
        NextLaunchWeather(temperature: 10)
            .frame(height: 125)
    }
}
