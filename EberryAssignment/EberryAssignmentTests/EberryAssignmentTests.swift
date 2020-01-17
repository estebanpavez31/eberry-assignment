//
//  EberryAssignmentTests.swift
//  EberryAssignmentTests
//
//  Created by Esteban Pavez on 2020-01-14.
//  Copyright © 2020 Esteban Pavez. All rights reserved.
//

import XCTest
@testable import EberryAssignment

class EberryAssignmentTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testOnlyOneSection() {
        let dataSource = ShowDataSource(shows: [.fixture()])

        XCTAssertEqual(dataSource.numberOfSections, 1)
    }

    func testRowsInSection() {
        let dataSource = ShowDataSource(shows: [.fixture(), .fixture(), .fixture()])

        XCTAssertEqual(dataSource.numberOfRows(inSection: 0), 3)
    }

    func testRowsInOutOfBoundsSectionIsZero() {
        let dataSource = ShowDataSource(shows: [.fixture(), .fixture(), .fixture()])

        XCTAssertEqual(dataSource.numberOfRows(inSection: 1), 0)
        XCTAssertEqual(dataSource.numberOfRows(inSection: -1), 0)
    }

    func testCallServiceTVShowsListSuccess() {
      // given
      let url = URL(string: Constants.Test.urlShows)
      let promise = expectation(description: "Completion handler invoked")
      var statusCode: Int?
      var responseError: Error?

      // when
      let dataTask = URLSession.shared.dataTask(with: url!) { data, response, error in
        statusCode = (response as? HTTPURLResponse)?.statusCode
        responseError = error
        promise.fulfill()
      }
      dataTask.resume()
        wait(for: [promise], timeout: Constants.Test.timeOut)

      // then
      XCTAssertNil(responseError)
      XCTAssertEqual(statusCode, Constants.Services.statusCodeSuccess)
    }

}
