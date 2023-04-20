//
//  ContentView.swift
//  SpaceMax
//
//  Created by Rafael Rocha on 18.04.23.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab: Tab = .nextLaunch
    
    enum Tab {
        case nextLaunch
    }
    
    var body: some View {
        TabView(selection: $selectedTab) {
            NextLaunchScreen()
                .tabItem {
                    Label("next-launch", systemImage: "arrow.up.and.person.rectangle.portrait")
                }
                .tag(Tab.nextLaunch)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
