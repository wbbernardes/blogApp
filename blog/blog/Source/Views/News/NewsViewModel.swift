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

    private var disposables = Set<AnyCancellable>()
    private var service: NewsProvider = NewsService()
    private let realm = try? Realm()

    public func getPosts() {
        if UserDefaults.standard.bool(forKey: UserDefaultKeys.firstTimeAccess) {
            service.getPosts()
                .sink(receiveCompletion: { _ in }, receiveValue: { [weak self] object in
                    self?.populateDB(postsList: object)
                })
                .store(in: &disposables)
        }
    }

    private func populateDB(postsList: [News]) {
        if postsList.count > 0,
           let realm = realm {
            realm.beginWrite()
            realm.add(postsList)
            try? realm.commitWrite()
            UserDefaults.standard.set(false, forKey: UserDefaultKeys.firstTimeAccess)
        }
    }
}
