//
//  EnvApp.swift
//  blog
//
//  Created by Wesley Brito Bernardes on 05/02/22.
//

import SwiftUI

class EnvApp: ObservableObject {
    @Published var colorScheme: ColorScheme = ColorScheme.light
    @Published var router: Router = Router()
}
