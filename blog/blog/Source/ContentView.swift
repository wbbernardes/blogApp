//
//  ContentView.swift
//  blog
//
//  Created by Wesley Brito Bernardes on 04/02/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = NewsViewModel()
    var body: some View {
        NavigationView {
            List(viewModel.postsList, id: \.self) { object in
                Text(object.title)
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
