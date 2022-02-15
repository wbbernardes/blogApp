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
    @State private var selectedItem: News?
    @StateObject private var viewModel: NewsViewModel
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
                    destination: NewsDetailView(news: selectedItem ?? News(), fromNews: true).environmentObject(envApp),
                    isActive: $envApp.router.newsView) { EmptyView() }
                backgroundImage
                ScrollView(.vertical) {
                    VStack {
                        ForEach(viewModel.newsList, id: \.id) { object in
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
                    if !stubMode {
                        viewModel.getPosts()
                    }
                })
                if viewModel.isLoading {
                    Loading(isLoading: $viewModel.isLoading)
                }
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

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
            .environmentObject(EnvApp())
    }
}
