//
//  NewsDetailViewModel.swift
//  blog
//
//  Created by Wesley Brito Bernardes on 08/02/22.
//

import Foundation
import Combine
import RealmSwift

class NewsDetailViewModel: ObservableObject {

    // MARK: - Properties

    private var disposables = Set<AnyCancellable>()
    private let realm = try? Realm()

    // MARK: - Public Methods

    public func saveAsFavorite(newsId: Int) {
        let test = realm?.objects(News.self).filter("id == %@", newsId).first
        try? realm?.write({
            test?.isFavorite = !(test?.isFavorite ?? false)
        })
    }

    // MARK: - Public Methods

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
