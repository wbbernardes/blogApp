//
//  TestUtils.swift
//  blogTests
//
//  Created by Wesley Brito Bernardes on 13/02/22.
//

import Foundation
import blog

class TestUtils {
    static func loadData(file: String) -> Data? {
        guard let url = Bundle(for: Self.self).url(forResource: file, withExtension: nil), let data = try? Data(contentsOf: url) else { return nil }
        return data
    }

    static func loadNewsData() -> [News] {
        if let data = TestUtils.loadData(file: "posts.json") {
            do {
                return try JSONDecoder().decode([News].self, from: data)
            } catch {
                print("Fail to parse => \(error)")
            }
        }
        return []
    }
}
