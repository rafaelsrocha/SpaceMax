//
//  Text+SpaceMax.swift
//  SpaceMax
//
//  Created by Rafael Rocha on 20.04.23.
//

import SwiftUI

extension Text {
    /// Default font design
    private var design: Font.Design { .rounded }

    /// Sets the Text's font to SpaceMax custom style.
    ///
    /// For example:
    ///
    ///     HStack {
    ///         Text("Hello").smText(.title2)
    ///         Text("World").smText(.title3, foregroundColor: .red)
    ///     }
    ///
    /// - Parameters:
    ///   - style: The style to use when displaying this text.
    ///   - foregroundColor: The text color to use when displaying this text.
    ///
    /// - Returns: A text view that uses the SpaceMax custom style.
    public func smText(_ style: Font.TextStyle = .body, foregroundColor: Color? = nil) -> Text {
        self.font(.system(style, design: design))
            .foregroundColor(foregroundColor ?? AppTheme.primaryFontColor)
    }

    /// Sets the Text's font to SpaceMax custom style.
    ///
    /// For example:
    ///
    ///     HStack {
    ///         Text("Hello").smText(size: 24)
    ///         Text("World").smText(size: 24, foregroundColor: .red)
    ///     }
    ///
    /// - Parameters:
    ///   - size: The text size to use when displaying this text.
    ///   - foregroundColor: The text color to use when displaying this text.
    ///
    /// - Returns: A text view that uses the SpaceMax custom style.
    public func smText(size: CGFloat, foregroundColor: Color? = nil) -> Text {
        self.font(.system(size: size, design: design))
            .foregroundColor(foregroundColor ?? AppTheme.primaryFontColor)
    }
}
