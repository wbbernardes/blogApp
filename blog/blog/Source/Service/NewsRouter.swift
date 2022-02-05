//
//  NewsRouter.swift
//  blog
//
//  Created by Wesley Brito Bernardes on 05/02/22.
//

import Foundation
import Networking

enum NewsRouter: RequestInfoConvertible {
    case getPosts

    var endpoint: String {
        "https://jsonplaceholder.typicode.com"
    }

    var urlString: String {
        "\(endpoint)/\(path)"
    }

    var path: String {
        switch self {
        case .getPosts:
            return "posts"
        }
    }

    func asRequestInfo() -> NetworkProvider {
        let requestInfo: NetworkProvider = NetworkProvider(url: urlString)
        return requestInfo
    }
}
