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
    @StateObject var viewModel = NewsViewModel()
    @ObservedResults(News.self) var news
    @State var selectedItem: News?

    // MARK: Views

    var body: some View {
        ZStack {
            NavigationLink(
                destination: NewsDetailView(news: selectedItem ?? News()).environmentObject(envApp),
                isActive: $envApp.router.newsView) { EmptyView() }
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
                viewModel.getPosts()
            })
        }
    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
            .environmentObject(EnvApp())
    }
}
