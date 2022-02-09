//
//  ContentView.swift
//  blog
//
//  Created by Wesley Brito Bernardes on 04/02/22.
//

import SwiftUI
import RealmSwift

struct ContentView: View {

    // MARK: - Properties

    @StateObject private var envApp: EnvApp = EnvApp()
    @StateObject var viewModel = NewsViewModel()
    @ObservedResults(News.self) var news
    @State var selectedItem: News?

    // MARK: Views

    var body: some View {
        ZStack {
            NavigationLink(
                destination: NewsDetailView(news: selectedItem ?? News()).environmentObject(envApp),
                isActive: $envApp.router.firstView) { EmptyView() }
            List {
                ForEach(news, id: \.id) { object in
                    Text(object.title)
                        .onTapGesture {
                            selectedItem = object
                            envApp.router.firstView = true
                        }
                }
            }
            .onAppear(perform: viewModel.getPosts)
            .navigationBarTitle("Posts")
            .listStyle(GroupedListStyle())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
