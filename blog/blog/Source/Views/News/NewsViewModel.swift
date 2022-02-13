//
//  NewsViewModel.swift
//  blog
//
//  Created by Wesley Brito Bernardes on 05/02/22.
//

import Foundation
import Combine
import RealmSwift
import UIKit

public protocol NewsViewProtocol: ObservableObject {

    var newsList: [News] { get set }

    func getPosts()
    func getFavorites() -> [News]
}

public class NewsViewModel: NewsViewProtocol {

    // MARK: - Properties

    @Published public var newsList: [News] = []
    @Published var isLoading: Bool = false
    private var disposables = Set<AnyCancellable>()
    private var service: NewsProvider = NewsService()
    private let realm = try? Realm()

    // MARK: - Public Methods

    public func getPosts() {
        isLoading = true
        if UserDefaults.standard.bool(forKey: UserDefaultKeys.firstTimeAccess) {
            service.getPosts()
                .receive(on: DispatchQueue.main)
                .sink(receiveCompletion: { _ in }, receiveValue: { [weak self] object in
                    self?.isLoading = false
                    self?.newsList = object
                    self?.populateDB(postsList: object)
                })
                .store(in: &disposables)
        } else {
            isLoading = false
        }
    }

    public func getFavorites() -> [News] {
        if let news = realm?.objects(News.self).filter("isFavorite == true") {
            newsList = news.map {
                return $0
            }
            return newsList
        }
        return []
    }

//    public func fillNews() -> [News] {
//        if let news = realm?.objects(News.self) {
//            newsList = news.map {
//                return $0
//            }
//            return newsList
//        }
//        return []
//    }

    // MARK: - Private Methods

    private func populateDB(postsList: [News]) {
        if postsList.count > 0,
           let realm = realm {
            realm.beginWrite()
            realm.add(postsList, update: .modified)
            try? realm.commitWrite()
            UserDefaults.standard.set(false, forKey: UserDefaultKeys.firstTimeAccess)
        }
    }
}
