//
//  HeaderButton.swift
//  blog
//
//  Created by Wesley Brito Bernardes on 11/02/22.
//

import SwiftUI

struct HeaderButton: View {
    var icon: String = ""
    let onPress: () -> Void?
    
    var body: some View {
        Button(action: {
                onPress()
        }) {
            Image(systemName: icon)
                .resizable()
                .frame(width: 24, height: 20)
                .foregroundColor(.white)
        }
    }
}
