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
    @StateObject private var viewModel = NewsViewModel()
    @State private var selectedItem: News?
    @State var newsList: [News] = []

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
                    viewModel.getFavorites()
                })
            }.preferredColorScheme(envApp.colorScheme)
        }
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
