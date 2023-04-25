//
//  View+SpaceMax.swift
//  SpaceMax
//
//  Created by Rafael Rocha on 20.04.23.
//

import SwiftUI

extension View {
    /// Removes list row separators and background from a view.
    /// Usually used on `NextLaunchScreen`.
    ///
    /// - Returns: A  view with no spearators and no background..
    public func nextLaunchListModifiers() -> some View {
        self.listRowSeparator(.hidden)
            .listRowBackground(Color.clear)
    }
}
