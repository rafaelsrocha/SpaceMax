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
    }

    init(type: ItemType, specValue: String) {
        itemType = type
        itemValue = specValue
    }

    var body: some View {
        HStack {
            switch itemType {
            case .height:
                Image(systemName: "ruler.fill")
                    .rotationEffect(Angle(degrees: 90))
                    .foregroundColor(AppTheme.primaryFontColor)
            case .mass:
                Image(systemName: "scalemass.fill")
                    .foregroundColor(AppTheme.primaryFontColor)
            case .diameter:
                Image(systemName: "circle.inset.filled")
                    .foregroundColor(AppTheme.primaryFontColor)
            }

            Text(itemValue).smText()
        }
    }
}

struct NextLaunchRocketSpecItem_Previews: PreviewProvider {
    static var previews: some View {
        NextLaunchRocketSpecItem(type: .height, specValue: "345m")
            .background(AppTheme.sectionBackground)
    }
}
