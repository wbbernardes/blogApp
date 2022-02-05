//
//  NetworkingTests.swift
//  NetworkingTests
//
//  Created by Wesley Brito Bernardes on 04/02/22.
//

import XCTest
import Combine
@testable import Networking

class NetworkingTests: XCTestCase {

    func test() {
        let exp = expectation(description: "Parse success")
        var disposables = Set<AnyCancellable>()
        
        getPosts().sink { _ in } receiveValue: { postList in
            let firstPost = postList.first
            let title = firstPost?.title != nil
            
            XCTAssert(title)
            exp.fulfill()
        }.store(in: &disposables)
        wait(for: [exp], timeout: 1)
    }

    private func getPosts() -> AnyPublisher<[News], Error> {
        TestUtils.mockNetworkClient(file: "posts.json").request(mockRouter.mock).decode()
    }
}

private enum mockRouter: RequestInfoConvertible {
    case mock
    func asRequestInfo() -> NetworkProvider {
        let requestInfo: NetworkProvider = NetworkProvider(url: "test")
        return requestInfo
    }
}

private struct News: Decodable {
    let title: String
}
