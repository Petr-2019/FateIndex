//
//  CraftEssenceStoreTests.swift
//  FateIndexTests
//
//  Created by Peter-Guan on 2020/6/6.
//  Copyright © 2020 FoxHound-Peter-Guan. All rights reserved.
//

import XCTest
@testable import FateIndex

class CraftEssenceStoreTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
            let craftEssences = CraftEssenceStore.shared.loadCraftEssences()
            XCTAssertEqual(craftEssences.count, 12)
        }
    }

}
