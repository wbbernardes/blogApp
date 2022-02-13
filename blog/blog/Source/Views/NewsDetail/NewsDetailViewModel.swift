//
//  NewsDetailViewModel.swift
//  blog
//
//  Created by Wesley Brito Bernardes on 08/02/22.
//

import Foundation
import Combine
import RealmSwift

public protocol NewsDetailProtocol: ObservableObject {
    func saveAsFavorite(newsId: Int)
}

public class NewsDetailViewModel: NewsDetailProtocol {

    // MARK: - Properties

    private var disposables = Set<AnyCancellable>()
    private let realm = try? Realm()

    // MARK: - Public Methods

    public func saveAsFavorite(newsId: Int) {
        let object = realm?.objects(News.self).filter("id == %@", newsId).first
        try? realm?.write({
            object?.isFavorite = !(object?.isFavorite ?? false)
        })
    }
}
