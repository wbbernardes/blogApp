//
//  ContentView.swift
//  blog
//
//  Created by Wesley Brito Bernardes on 04/02/22.
//

import SwiftUI
import RealmSwift

struct ContentView: View {

    // MARK: - Properties

    @State private var selection: Int = 0
    @StateObject private var envApp: EnvApp = EnvApp()

    // MARK: Views

    var body: some View {
        TabView(selection: $selection) {
            NewsView()
                .environmentObject(envApp)
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("News")
                }
                .tag(0)
            
            FavoriteView()
                .environmentObject(envApp)
                .tabItem {
                    Image(systemName: "bookmark.circle.fill")
                    Text("Favorite")
                }
                .tag(1)
        }.accentColor(.white)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
