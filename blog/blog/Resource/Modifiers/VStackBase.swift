//
//  VStackBase.swift
//  blog
//
//  Created by Wesley Brito Bernardes on 04/02/22.
//

import SwiftUI

struct VStackModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(
                minWidth: 0,
                maxWidth: .infinity,
                minHeight: 0,
                maxHeight: .infinity,
                alignment: .center
            )
    }
}

extension View {
    func VStackBase() -> ModifiedContent<Self, VStackModifier> {
        return modifier(VStackModifier())
    }
}
