//
//  NewsDetailProtocolMock.swift
//  blogTests
//
//  Created by Wesley Brito Bernardes on 13/02/22.
//

import Foundation
import blog

public class NewsDetailProtocolMock: NewsDetailProtocol {
    public init() { }


    public private(set) var saveAsFavoriteCallCount = 0
    public var saveAsFavoriteHandler: ((Int) -> ())?
    public func saveAsFavorite(newsId: Int)  {
        saveAsFavoriteCallCount += 1
        if let saveAsFavoriteHandler = saveAsFavoriteHandler {
            saveAsFavoriteHandler(newsId)
        }
        
    }
}
