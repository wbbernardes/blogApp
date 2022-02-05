//
//  NewsViewModel.swift
//  blog
//
//  Created by Wesley Brito Bernardes on 05/02/22.
//

import Foundation
import Combine

class NewsViewModel: ObservableObject {
    
    @Published var postsList: [News] = []
    
    private var disposables = Set<AnyCancellable>()
    private var service: NewsProvider = NewsService()
    
    func getPosts() {
        service.getPosts()
            .replaceError(with: [])
            .assign(to: &$postsList)
    }
}
