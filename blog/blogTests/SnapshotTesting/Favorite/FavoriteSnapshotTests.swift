//
//  FavoriteSnapshotTests.swift
//  blogTests
//
//  Created by Wesley Brito Bernardes on 13/02/22.
//

import XCTest
import SwiftUI
import SnapshotTesting
@testable import blog

class FavoriteSnapshotTests: XCTestCase {

    let newsList = TestUtils.loadNewsData()
    var viewController: UIViewController!

    override func setUp() {
        super.setUp()
        let newsDetail = FavoriteView(newsList: newsList)
        viewController = UIHostingController(rootView: newsView.environmentObject(EnvApp()))
        isRecording = false
    }

    override func tearDown() {
        viewController = nil
    }

    func testFavoriteViewWithJsonData() {
        assertSnapshot(matching: viewController, as: .image(on: .iPhone8(.portrait)))
    }
}