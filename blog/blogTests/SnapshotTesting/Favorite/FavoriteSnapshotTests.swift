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
    var viewModel: NewsViewModel!
    var viewController: UIViewController!

    override func setUp() {
        super.setUp()
        viewModel = NewsViewModel(newsList: newsList)
        let favoriteView = FavoriteView(viewModel: viewModel, stubMode: true)
        viewController = UIHostingController(rootView: favoriteView.environmentObject(EnvApp()))
        isRecording = false
    }

    override func tearDown() {
        viewController = nil
        viewModel = nil
    }

    func testFavoriteViewWithJsonData() {
        assertSnapshot(matching: viewController, as: .image(on: .iPhone8(.portrait)))
    }
}
