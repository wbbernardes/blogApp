//
//  TestUtils.swift
//  NetworkingTests
//
//  Created by Wesley Brito Bernardes on 05/02/22.
//

import Foundation

class TestUtils {
    static func loadData(file: String) -> Data? {
        guard let url = Bundle(for: Self.self).url(forResource: file, withExtension: nil), let data = try? Data(contentsOf: url) else { return nil }
        return data
    }
    
    static func mockNetworkClient(file: String) -> MockAlamofireAdapter {
        let data = loadData(file: file)
        return MockAlamofireAdapter(response: (data, nil))
    }
}
