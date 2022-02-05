//
//  NewsProvider.swift
//  blog
//
//  Created by Wesley Brito Bernardes on 05/02/22.
//

import Foundation
import Combine
import Networking

protocol NewsProvider {
    func getPosts() -> AnyPublisher<[News], Error>
}

class NewsService: NewsProvider {
    var alamofireProvider: AlamofireProvider = AlamofireAdapter.instance
    
    func getPosts() -> AnyPublisher<[News], Error> {
        alamofireProvider.request(NewsRouter.getPosts).decode()
    }
}
