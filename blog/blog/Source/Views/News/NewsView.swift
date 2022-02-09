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
            List {
                ForEach(news, id: \.id) { object in
                    Text(object.title)
                        .onTapGesture {
                            selectedItem = object
                            envApp.router.newsView = true
                        }
                }
            }
            .onAppear(perform: {
                envApp.title = .news
                viewModel.getPosts()
            })
            .navigationBarTitle(envApp.title.rawValue)
            .listStyle(.plain)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}
