//
//  Loading.swift
//  blog
//
//  Created by Wesley Brito Bernardes on 04/02/22.
//

import SwiftUI

struct Loading: View {
    @Binding var isLoading: Bool

    var body: some View {
        VStack {
            HStack {
                CenteredLoadingView(isLoading: $isLoading)
            }
        }
    }
}

struct CenteredLoadingView: View {
    @Binding var isLoading: Bool

    var body: some View {
        LoadingActivity(displayLoading: $isLoading)
    }

    struct LoadingActivity: UIViewRepresentable {
        @Binding var displayLoading: Bool
        @State private var viewWindow: UIWindow?

        func makeUIView(context: Context) -> UIView {
            let view = UIView()
            DispatchQueue.main.async {
                self.viewWindow = view.window
            }
            return view
        }

        func updateUIView(_ uiView: UIView, context: Context) {
            guard let holder = viewWindow?.rootViewController?.view else { return }
            if displayLoading && context.coordinator.controller == nil {
                context.coordinator.controller = UIHostingController(rootView: viewLoading)
                let view = context.coordinator.controller!.view
                view?.backgroundColor = UIColor.white.withAlphaComponent(0.5)
                view?.translatesAutoresizingMaskIntoConstraints = false
                holder.addSubview(view!)
                holder.isUserInteractionEnabled = false
                view?.leadingAnchor.constraint(equalTo: holder.leadingAnchor).isActive = true
                view?.trailingAnchor.constraint(equalTo: holder.trailingAnchor).isActive = true
                view?.topAnchor.constraint(equalTo: holder.topAnchor).isActive = true
                view?.bottomAnchor.constraint(equalTo: holder.bottomAnchor).isActive = true
            } else if !displayLoading {
                context.coordinator.controller?.view.removeFromSuperview()
                context.coordinator.controller = nil
                holder.isUserInteractionEnabled = true
            }
        }

        func makeCoordinator() -> Coordinator {
            Coordinator()
        }

        class Coordinator {
            var controller: UIViewController?
        }

        private var viewLoading: some View {
            ProgressView()
                .scaleEffect(2, anchor: .center)
                .progressViewStyle(CircularProgressViewStyle(tint: .black))
        }
    }
}
