//
//  to_watch_list_imdb_iosTests.swift
//  to_watch_list_imdb_iosTests
//
//  Created by Raoni Valadares on 3/20/16.
//  Copyright © 2016 Raoni Valadares. All rights reserved.
//

import XCTest
@testable import to_watch_list_imdb_ios

class to_watch_list_imdb_iosTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testMovieInitialization() {
        
        // Success case.
        let potentialItem = Movie(name: "Newest Moview")
        XCTAssertNotNil(potentialItem)
        
        // Failure cases.
        let noName = Movie(name: "")
        XCTAssertNil(noName, "Empty name is invalid")
        
    }
    
}
