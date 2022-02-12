//
//  CardModifier.swift
//  blog
//
//  Created by Wesley Brito Bernardes on 11/02/22.
//

import SwiftUI

struct CardModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .cornerRadius(20)
            .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 0)
    }
    
}

extension View {
    func CardRadius() -> ModifiedContent<Self, CardModifier> {
        return modifier(CardModifier())
    }
}
