//
//  NewsDetailView.swift
//  blog
//
//  Created by Wesley Brito Bernardes on 08/02/22.
//

import SwiftUI
import RealmSwift

struct NewsDetailView: View {

    @Environment(\.presentationMode) var presentationMode
    @StateObject var viewModel = NewsDetailViewModel()
    @State var news: News

    var body: some View {
        VStack(alignment: .leading,spacing: 16) {
            Text(news.title)
                .font(.system(size: 22))
                .fontWeight(.semibold)
                .foregroundColor(.black)
            
            Text(news.body)
                .foregroundColor(.black)
                .font(.system(size: 16))
            Button("Temporary button") {
                viewModel.saveAsFavorite(newsId: news.id)
            }
            Spacer()
        }
        .VStackBase()
        .padding(.horizontal, 20)
        .navigationBarItems(
            leading:
                HeaderButton(icon: "arrow.left") {
                    self.presentationMode.wrappedValue.dismiss()
                }
        )
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarBackButtonHidden(true)
    }
}

struct NewsDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NewsDetailView(news: News())
    }
}
