//
//  NewsViewModelTests.swift
//  blogTests
//
//  Created by Wesley Brito Bernardes on 13/02/22.
//

import XCTest
@testable import blog

class NewsViewModelTests: XCTestCase {

    private var viewModel: NewsViewProtocolMock!
    private weak var weakSut: NewsViewProtocolMock?

    override func setUp() {
        super.setUp()
        viewModel = NewsViewProtocolMock(newsList: [])
        weakSut = viewModel
    }

    override func tearDown() {
        viewModel = nil
        XCTAssertNil(weakSut)
    }

    func testGetPosts() {
        let expectation = XCTestExpectation(description: "complete")
        viewModel = NewsViewProtocolMock(newsList: TestUtils.loadNewsData())

        viewModel.getPostsHandler = {
            XCTAssertEqual(self.viewModel.getPostsCallCount, 1)
            expectation.fulfill()
        }
        viewModel.getPosts()
        wait(for: [expectation], timeout: 1)
        XCTAssertTrue(viewModel.newsList.count > 0)
    }

    func testGetFavorites() {
        let expectation = XCTestExpectation(description: "complete")
        viewModel = NewsViewProtocolMock(newsList: TestUtils.loadNewsData())

        viewModel.getFavoritesHandler = {
            self.viewModel.newsList = self.viewModel.newsList.filter {
                return $0.isFavorite == true
            }
            XCTAssertEqual(self.viewModel.getFavoritesCallCount, 1)
            expectation.fulfill()
            return []
        }
        _ = viewModel.getFavorites()
        wait(for: [expectation], timeout: 1)
        XCTAssertTrue(viewModel.newsList.count > 0)
    }
}
