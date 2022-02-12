//
//  VStackDetailModifier.swift
//  blog
//
//  Created by Wesley Brito Bernardes on 12/02/22.
//

import SwiftUI

struct VStackDetailModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .clipShape(CornerRadiusShape(radius: 25, corners: [.topLeft, .topRight]))
            .shadow(color: Color.white.opacity(0.5), radius: 20, x: 0, y: 0)
    }
}

fileprivate struct CornerRadiusShape: Shape {
    var radius = CGFloat.infinity
    var corners = UIRectCorner.allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension View {
    func VStackDetail() -> ModifiedContent<Self, VStackDetailModifier> {
        return modifier(VStackDetailModifier())
    }
}
