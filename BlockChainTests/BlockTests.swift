//
//  BlockTests.swift
//  BlockChainTests
//
//  Created by shindyu on 2018/01/09.
//  Copyright © 2018年 shindyu. All rights reserved.
//

import XCTest
@testable import BlockChain

class BlockTests: XCTestCase {
    func test_initialize() {
        let transaction = Transaction(
            sender: "8527147fe1f5426f9dd545de4b27ee00",
            recipient: "a77f5cdfa2934df3954a5c7c7da5df1f",
            amount: 5
        )
        let block = Block(
            index: 1,
            timestamp: 1506057125.900785,
            transactions: [transaction],
            proof: 324984774000,
            previousHash: "2cf24dba5fb0a30e26e83b2ac5b9e29e1b161e5c1fa7425e73043362938b9824"
        )

        XCTAssertEqual(block.index, 1)
        XCTAssertEqual(block.timestamp, 1506057125.900785)
        XCTAssertEqual(block.transactions, [transaction])
        XCTAssertEqual(block.proof, 324984774000)
        XCTAssertEqual(block.previousHash, "2cf24dba5fb0a30e26e83b2ac5b9e29e1b161e5c1fa7425e73043362938b9824")
    }
}
