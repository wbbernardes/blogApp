//
//  blogApp.swift
//  blog
//
//  Created by Wesley Brito Bernardes on 04/02/22.
//

import SwiftUI

@main
struct blogApp: App {

    init() {
        UserDefaults.standard.register(defaults: [UserDefaultKeys.firstTimeAccess : true])
        UITabBar.appearance().barTintColor = UIColor(UIKit.Colors.gray6)
        
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
