//
//  NewsView.swift
//  blog
//
//  Created by Wesley Brito Bernardes on 09/02/22.
//

import SwiftUI

import SwiftUI
import RealmSwift

struct NewsView: View {

    // MARK: - Properties

    @EnvironmentObject private var envApp: EnvApp
    @StateObject private var viewModel = NewsViewModel()
    @ObservedResults(News.self) private var news
    @State private var selectedItem: News?

    // MARK: Views

    var body: some View {
        NavigationView {
            ZStack {
                NavigationLink(
                    destination: NewsDetailView(news: selectedItem ?? News(), fromNews: true).environmentObject(envApp),
                    isActive: $envApp.router.newsView) { EmptyView() }
                backgroundImage
                ScrollView(.vertical) {
                    VStack {
                        ForEach(news, id: \.id) { object in
                            CardView(cardObject: object)
                                .onTapGesture {
                                    selectedItem = object
                                    envApp.router.newsView = true
                                }
                        }
                    }
                    .padding(.horizontal, 20)
                }
                .onAppear(perform: {
                    envApp.colorScheme = .light
                    viewModel.getPosts()
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

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
            .environmentObject(EnvApp())
    }
}
