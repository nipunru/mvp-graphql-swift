//
//  OtriumGithubTests.swift
//  OtriumGithubTests
//
//  Created by Nipun Ruwanpathirana on 2021-07-01.
//

import XCTest
@testable import OtriumGithub

class OtriumGithubTests: XCTestCase {

    func testProfileFetch() throws {
        let username = "rmosolgo"
        let viewController = ProfileViewController()
        
        let presenter = ProfilePresenter()
        presenter.setViewDelegate(delegate: viewController)
        presenter.fetchProfile(username: username)
        
        waitForExpectations(timeout: 5, handler: nil)
        
        XCTAssertEqual(viewController.lblUsername.text, username)
    }
}
