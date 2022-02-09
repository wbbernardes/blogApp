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
    @StateObject var viewModel = NewsViewModel()
    @State var selectedItem: News?

    // MARK: Views

    var body: some View {
        ZStack {
            NavigationLink(
                destination: NewsDetailView(news: selectedItem ?? News()).environmentObject(envApp),
                isActive: $envApp.router.favoriteView) { EmptyView() }
            List {
                ForEach(viewModel.newsList, id: \.self) { object in
                    Text(object.title)
                        .onTapGesture {
                            selectedItem = object
                            envApp.router.favoriteView = true
                        }
                }
            }
            .onAppear(perform: {
                envApp.title = .favorites
                viewModel.getFavorites()
            })
            .navigationBarTitle(envApp.title.rawValue)
            .listStyle(GroupedListStyle())
        }
    }
}

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView()
    }
}
