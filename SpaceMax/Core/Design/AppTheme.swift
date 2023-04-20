//
//  AppTheme.swift
//  SpaceMax
//
//  Created by Rafael Rocha on 19.04.23.
//

import SwiftUI

struct AppTheme {
    private init() {}
    /// Dark gray color
    private static let darkGray30 = Color(red: 33/255, green: 35/255, blue: 37/255)
    /// Light gray color
    private static let lightGray80 = Color(red: 200/255, green: 200/255, blue: 200/255)
    /// Screen / Page background color
    static var screenBackground: Color { .black }
    /// Section / Card background color
    static var sectionBackground: Color { darkGray30 }
    /// App font's primary color
    static var primaryFontColor: Color { .white }
    /// App font's secondary color
    static var secondaryFontColor: Color { lightGray80 }
}
