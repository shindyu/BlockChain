//
//  BlockChainTests.swift
//  BlockChainTests
//
//  Created by shindyu on 2018/01/09.
//  Copyright © 2018年 shindyu. All rights reserved.
//

import XCTest
@testable import BlockChain

class BlockChainTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_initialize() {
        let blockChain = BlockChain()

        XCTAssertTrue(blockChain.chain.isEmpty)
        XCTAssertTrue(blockChain.currentTransaction.isEmpty)
    }
}
