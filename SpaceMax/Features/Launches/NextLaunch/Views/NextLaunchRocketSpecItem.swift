//
//  NextLaunchRocketSpecItem.swift
//  SpaceMax
//
//  Created by Rafael Rocha on 20.04.23.
//

import SwiftUI

struct NextLaunchRocketSpecItem: View {
    private let itemType: ItemType
    private let itemValue: String

    enum ItemType {
        case height
        case mass
        case diameter
        case payloadMass
    }

    init(type: ItemType, specValue: String) {
        itemType = type
        itemValue = specValue
    }

    var body: some View {
        HStack {
            Image(systemName: imageName)
                .foregroundColor(Color("PrimaryFontColor"))
            Text(itemValue)
                .smText()
                .scaledToFit()
        }
        .padding(.vertical, 2)
    }

    private var imageName: String {
        switch itemType {
        case .height:
            return "ruler.fill"
        case .mass:
            return "scalemass.fill"
        case .diameter:
            return "circle.inset.filled"
        case .payloadMass:
            return "bag.fill.badge.plus"
        }
    }
}

struct NextLaunchRocketSpecItem_Previews: PreviewProvider {
    static var previews: some View {
        NextLaunchRocketSpecItem(type: .height, specValue: "345m")
            .background(Color("SectionBackground"))
    }
}
