//
//  ContentView.swift
//  HomeServiceApp
//
//  Created by Dimitar Angelov on 28.09.24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            SubscriptionListView()
                .tabItem {
                    Label("Абонаменти", systemImage: "list.bullet")
                }
            
            UserProfileIconView()
                .tabItem {
                    Label("Профил", systemImage: "person.circle")
                }
        }
    }
}
