//
//  NewsDetailView.swift
//  blog
//
//  Created by Wesley Brito Bernardes on 08/02/22.
//

import SwiftUI
import RealmSwift

struct NewsDetailView: View {

    // MARK: - Properties

    @EnvironmentObject private var envApp: EnvApp
    @StateObject private var viewModel = NewsDetailViewModel()
    @State var news: News
    @State var fromNews: Bool

    // MARK: Views

    var body: some View {
        ZStack {
            backgroundImage
            VStack {
                Spacer()
                VStack(alignment: .leading,spacing: 16) {
                    Text(news.title)
                        .font(.system(size: 22))
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                    
                    Text(news.body)
                        .foregroundColor(.black)
                        .font(.system(size: 16))
                }
                .padding(20)
                .preferredColorScheme(envApp.colorScheme)
                .frame(maxWidth: .infinity, alignment: .center)
                .background(.white)
                .VStackDetail()
                .navigationBarItems(
                    leading:
                        HeaderButton(icon: "arrow.left") {
                            popView()
                        },
                    trailing:
                        HeaderButton(icon: news.isFavorite ? "star.fill" : "star") {
                            viewModel.saveAsFavorite(newsId: news.id)
                            return popView()
                        }
                )
                .navigationBarTitle("", displayMode: .inline)
                .navigationBarBackButtonHidden(true)
            }
        }.onAppear {
            envApp.colorScheme = .dark
        }
    }

    private var backgroundImage: some View {
        GeometryReader { geo in
            Image(UIKit.Image.background)
                .resizable()
                .frame(width: geo.size.width, height: geo.size.height)
                .aspectRatio(contentMode: .fit)
            
        }.edgesIgnoringSafeArea(.vertical)
    }

    // MARK: Methods

    private func popView() {
        envApp.colorScheme = .light
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
            .environmentObject(EnvApp())
    }
}
