//
//  UINavigationBar+SpaceMax.swift
//  SpaceMax
//
//  Created by Rafael Rocha on 20.04.23.
//

import UIKit
import SwiftUI

extension UINavigationBar {
    /// Sets the NavigationBar appearance to SpaceMax custom style.
    public static func setSpaceMaxAppearance() {
        let titleSize = UIFont.preferredFont(forTextStyle: .title1).pointSize
        let largeTitleSize = UIFont.preferredFont(forTextStyle: .largeTitle).pointSize

        let navBarAppearance = UINavigationBar.appearance()
        navBarAppearance.largeTitleTextAttributes = [
            .foregroundColor: UIColor(Color("PrimaryFontColor")),
            .font: assembleFont(forSize: largeTitleSize)
        ]
        navBarAppearance.titleTextAttributes = [
            .foregroundColor: UIColor(Color("PrimaryFontColor")),
            .font: assembleFont(forSize: titleSize)
        ]
    }

    /// Creates the UIFont using SpaceMax custom style.
    ///
    /// - Parameters:
    ///   - forSize: The size to use when displaying the NavigationBar title.
    ///
    /// - Returns: A font that uses the SpaceMax custom style.
    private static func assembleFont(forSize size: CGFloat) -> UIFont {
        let systemFont = UIFont.systemFont(ofSize: size, weight: .bold)

        let font: UIFont
        if let descriptor = systemFont.fontDescriptor.withDesign(.rounded) {
            font = UIFont(descriptor: descriptor, size: size)
        } else {
            font = systemFont
        }

        return font
    }
}
