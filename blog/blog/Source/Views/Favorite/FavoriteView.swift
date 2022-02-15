//
//  FavoriteView.swift
//  blog
//
//  Created by Wesley Brito Bernardes on 09/02/22.
//

import SwiftUI

struct FavoriteView: View {

    // MARK: - Properties

    @EnvironmentObject private var envApp: EnvApp
    @State private var selectedItem: News?
    @StateObject public var viewModel: NewsViewModel
    @State public var stubMode: Bool

    public init(viewModel: NewsViewModel = NewsViewModel(), stubMode: Bool = false) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.stubMode = stubMode
    }

    // MARK: Views

    var body: some View {
        NavigationView {
            ZStack {
                NavigationLink(
                    destination: NewsDetailView(news: selectedItem ?? News(), fromNews: false).environmentObject(envApp),
                    isActive: $envApp.router.favoriteView) { EmptyView() }
                backgroundImage
                ScrollView(.vertical) {
                    VStack {
                        ForEach(viewModel.newsList, id: \.id) { object in
                            CardView(cardObject: object)
                                .onTapGesture {
                                    selectedItem = object
                                    envApp.router.favoriteView = true
                                }
                        }
                    }
                    .padding(.horizontal, 20)
                }
                .onAppear(perform: {
                    envApp.colorScheme = .light
                    if !stubMode {
                        viewModel.getFavorites()
                    }
                })
            }.preferredColorScheme(envApp.colorScheme)
        }.navigationViewStyle(StackNavigationViewStyle())
    }

    private var backgroundImage: some View {
        GeometryReader { geo in
            Image(UIKit.Image.newsBackground)
                .resizable()
                .frame(width: geo.size.width, height: geo.size.height)
                .aspectRatio(contentMode: .fit)
        }.edgesIgnoringSafeArea(.vertical)
    }
}

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView()
    }
}
