//
//  NewsViewModel.swift
//  blog
//
//  Created by Wesley Brito Bernardes on 05/02/22.
//

import Foundation
import Combine
import RealmSwift

class NewsViewModel: ObservableObject {
    
    @Published var postsList: [News] = []
    @ObservedResults(News.self) var posts
    
    private var disposables = Set<AnyCancellable>()
    private var service: NewsProvider = NewsService()
    private let realm = try? Realm()
    
    func getPosts(completion: @escaping () -> Void) {
        service.getPosts()
            .replaceError(with: [])
            .sink(receiveCompletion: { _ in }, receiveValue: { [weak self] object in
                self?.postsList = object
                completion()
            })
            .store(in: &disposables)
    }
    
    func insertFirstTimeDB() {
        if postsList.count > 0,
           let realm = realm {
            realm.beginWrite()
            realm.add(postsList)
            try? realm.commitWrite()
        }
    }

    func checkFlow() {
        let firstTime = false
        if firstTime {
            getPosts {
                self.insertFirstTimeDB()
            }
        }
    }
}
