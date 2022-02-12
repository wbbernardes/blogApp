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
                destination: NewsDetailView(news: selectedItem ?? News(), fromNews: false).environmentObject(envApp),
                isActive: $envApp.router.favoriteView) { EmptyView() }
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
                viewModel.getFavorites()
            })
        }
    }
}

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView()
    }
}
