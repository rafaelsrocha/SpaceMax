//
//  SpaceMaxApp.swift
//  SpaceMax
//
//  Created by Rafael Rocha on 18.04.23.
//

import SwiftUI

@main
struct SpaceMaxApp: App {
    init() {
        UINavigationBar.setSpaceMaxAppearance()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
