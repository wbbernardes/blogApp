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
        viewModel = NewsViewProtocolMock(newsList: loadData())

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
        viewModel = NewsViewProtocolMock(newsList: loadData())

        viewModel.getFavoritesHandler = {
            self.viewModel.newsList = self.viewModel.newsList.filter {
                return $0.isFavorite == true
            }
            XCTAssertEqual(self.viewModel.getFavoritesCallCount, 1)
            expectation.fulfill()
        }
        viewModel.getFavorites()
        wait(for: [expectation], timeout: 1)
        XCTAssertTrue(viewModel.newsList.count > 0)
    }

    private func loadData() -> [News] {
        if let data = TestUtils.loadData(file: "posts.json") {
            do {
                return try JSONDecoder().decode([News].self, from: data)
            } catch {
                XCTFail("Fail to parse")
            }
        }
        return []
    }
    

}
