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

    func test_createBlock() {
        let blockChain = BlockChain()

        blockChain.createBlock()

        XCTAssertEqual(blockChain.chain.count, 1)
    }

    func test_createTransaction_appendToCurrentTransaction() {
        let blockChain = BlockChain()

        _ = blockChain.createTransaction(
            sender: "8527147fe1f5426f9dd545de4b27ee00",
            recipient: "a77f5cdfa2934df3954a5c7c7da5df1f",
            amount: 5
        )

        XCTAssertEqual(blockChain.currentTransaction.count, 1)
    }

    func test_createTransaction_returnNextIndex() {
        let blockChain = BlockChain()

        let index = blockChain.createTransaction(
            sender: "8527147fe1f5426f9dd545de4b27ee00",
            recipient: "a77f5cdfa2934df3954a5c7c7da5df1f",
            amount: 5
        )

        XCTAssertEqual(index, 2)
    }
}
