//
//  News.swift
//  blog
//
//  Created by Wesley Brito Bernardes on 05/02/22.
//

import Foundation
import RealmSwift

class News: Object, Decodable, Identifiable {
    @Persisted(primaryKey: true) var id: Int
    @Persisted var userId: Int
    @Persisted var title: String
    @Persisted var body: String

    private enum CodingKeys: String, CodingKey {
        case userId = "userId"
        case id = "id"
        case title = "title"
        case body = "body"
    }
}
