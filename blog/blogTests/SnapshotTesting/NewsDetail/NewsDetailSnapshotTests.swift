//
//  NewsDetailSnapshotTests.swift
//  blogTests
//
//  Created by Wesley Brito Bernardes on 13/02/22.
//

import XCTest
import SwiftUI
import SnapshotTesting
@testable import blog

class NewsDetailSnapshotTests: XCTestCase {

    let newsList = TestUtils.loadNewsData()
    var news: News!
    var viewController: UIViewController!

    override func setUp() {
        super.setUp()
        if let news = newsList.first {
            self.news = news
        }
        let newsDetail = NewsDetailView(news: news, fromNews: true)
        viewController = UIHostingController(rootView: newsDetail.environmentObject(EnvApp()))
        isRecording = false
    }

    override func tearDown() {
        viewController = nil
    }

    func testNewsDetailViewWithJsonData() {
        assertSnapshot(matching: viewController, as: .image(on: .iPhone8(.portrait)))
    }
}
