//
//  NewsSnapshotTests.swift
//  blogTests
//
//  Created by Wesley Brito Bernardes on 13/02/22.
//

import XCTest
import SwiftUI
import SnapshotTesting
@testable import blog

class NewsSnapshotTests: XCTestCase {

    let newsList = TestUtils.loadNewsData()
    var viewController: UIViewController!

    override func setUp() {
        super.setUp()
        let newsView = NewsView(newsList: newsList)
        viewController = UIHostingController(rootView: newsView.environmentObject(EnvApp()))
        isRecording = false
    }

    override func tearDown() {
        viewController = nil
    }

    func testNewsViewWithJsonData() {
        
        assertSnapshot(matching: viewController, as: .image(on: .iPhone8(.portrait)))
    }
}
