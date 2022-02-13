//
//  NewsDetailViewModelTests.swift
//  blogTests
//
//  Created by Wesley Brito Bernardes on 13/02/22.
//

import XCTest
@testable import blog

class NewsDetailViewModelTests: XCTestCase {

    private var viewModel: NewsDetailProtocolMock!
    private weak var weakSut: NewsDetailProtocolMock?

    override func setUp() {
        super.setUp()
        viewModel = NewsDetailProtocolMock()
        weakSut = viewModel
    }

    override func tearDown() {
        viewModel = nil
        XCTAssertNil(weakSut)
    }

    func testSaveAsFavorite() {
        var newsList: [News] = loadData()
        let expectation = XCTestExpectation(description: "complete")

        viewModel.saveAsFavoriteHandler = { objectId in
            newsList = newsList.filter {
                return $0.id == objectId
            }
            newsList.first?.isFavorite = true
            XCTAssertEqual(self.viewModel.saveAsFavoriteCallCount, 1)
            expectation.fulfill()
        }
        viewModel.saveAsFavorite(newsId: 1)
        wait(for: [expectation], timeout: 1)
        XCTAssertTrue(newsList.first?.isFavorite ?? false)
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
