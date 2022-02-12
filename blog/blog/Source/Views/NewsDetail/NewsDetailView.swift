//
//  NewsDetailView.swift
//  blog
//
//  Created by Wesley Brito Bernardes on 08/02/22.
//

import SwiftUI
import RealmSwift

struct NewsDetailView: View {

    @EnvironmentObject private var envApp: EnvApp
    @StateObject var viewModel = NewsDetailViewModel()
    @State var news: News
    @State var fromNews: Bool

    var body: some View {
        VStack(alignment: .leading,spacing: 16) {
            Text(news.title)
                .font(.system(size: 22))
                .fontWeight(.semibold)
                .foregroundColor(.black)
            
            Text(news.body)
                .foregroundColor(.black)
                .font(.system(size: 16))
            Spacer()
        }
        .VStackBase()
        .padding(.horizontal, 20)
        .navigationBarItems(
            leading:
                HeaderButton(icon: "arrow.left") {
                    popView()
                },
            trailing:
                HeaderButton(icon: news.isFavorite ? "heart.fill" : "heart") {
                    viewModel.saveAsFavorite(newsId: news.id)
                    return popView()
                }
        )
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarBackButtonHidden(true)
    }

    private func popView() {
        if fromNews {
            return envApp.router.newsView = false
        } else {
            return envApp.router.favoriteView = false
        }
    }
}

struct NewsDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NewsDetailView(news: News(), fromNews: false)
    }
}
