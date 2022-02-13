//
//  TestUtils.swift
//  blogTests
//
//  Created by Wesley Brito Bernardes on 13/02/22.
//

import Foundation

class TestUtils {
    static func loadData(file: String) -> Data? {
        guard let url = Bundle(for: Self.self).url(forResource: file, withExtension: nil), let data = try? Data(contentsOf: url) else { return nil }
        return data
    }
}
