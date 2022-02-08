//
//  ContentView.swift
//  blog
//
//  Created by Wesley Brito Bernardes on 04/02/22.
//

import SwiftUI
import RealmSwift

struct ContentView: View {
    @StateObject var viewModel = NewsViewModel()
    @ObservedResults(News.self) var news
    
    var body: some View {
        NavigationView {
            List(news, id: \.self) { object in
                Text(object.title)
            }
            .onAppear(perform: viewModel.checkFlow)
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
