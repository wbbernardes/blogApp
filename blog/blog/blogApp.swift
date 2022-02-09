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
        UITableViewCell.appearance().selectionStyle = .none
    }

    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }.navigationViewStyle(DefaultNavigationViewStyle())
        }
    }
}
