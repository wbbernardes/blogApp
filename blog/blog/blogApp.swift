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
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
