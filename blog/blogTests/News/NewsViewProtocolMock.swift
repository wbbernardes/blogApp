//
//  NewsViewProtocolMock.swift
//  blogTests
//
//  Created by Wesley Brito Bernardes on 13/02/22.
//

import Foundation
import blog

public class NewsViewProtocolMock: NewsViewProtocol {
    
    public init(newsList: [News] = []) {
        self.newsList = newsList
    }

    public private(set) var newsListCallCount = 0
    public var newsList: [News] { didSet { newsListCallCount += 1 } }

    public private(set) var getPostsCallCount = 0
    public var getPostsHandler: (() -> ())?
    public func getPosts()  {
        getPostsCallCount += 1
        if let getPostsHandler = getPostsHandler {
            getPostsHandler()
        }
        
    }

    public private(set) var getFavoritesCallCount = 0
    public var getFavoritesHandler: (() -> ())?
    public func getFavorites()  {
        getFavoritesCallCount += 1
        if let getFavoritesHandler = getFavoritesHandler {
            getFavoritesHandler()
        }

    }
}
