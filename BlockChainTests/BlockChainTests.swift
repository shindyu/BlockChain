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
    var blockChain: BlockChain!

    override func setUp() {
        super.setUp()

        blockChain = BlockChain(dateProvider: FakeDateProvider())
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_initialize_createGenesisBlock() {
        let genesisBlock = Block(
            index: 1,
            timestamp: FakeDateProvider().timestamp(),
            transactions: [],
            proof: 100,
            previousHash: "1"
        )

        XCTAssertEqual(blockChain.chain.count, 1)
        XCTAssertEqual(blockChain.chain.last, genesisBlock)
        XCTAssertTrue(blockChain.currentTransactions.isEmpty)
    }

    func test_createBlock() {
        _ = blockChain.createTransaction(sender: "test", recipient: "test", amount: 1)

        let prevBlockCount = blockChain.chain.count
        let prevTransaction = blockChain.currentTransactions
        let prevBlock = blockChain.lastBlock

        blockChain.createBlock(proof: 100, previousHash: "1")

        XCTAssertEqual(blockChain.chain.count, prevBlockCount + 1)
        XCTAssertEqual(blockChain.currentTransactions, [])
        XCTAssertEqual(blockChain.lastBlock.index, prevBlock.index + 1)
        XCTAssertEqual(blockChain.lastBlock.transactions, prevTransaction)
    }

    func test_createTransaction_appendToCurrentTransaction() {
        _ = blockChain.createTransaction(
            sender: "8527147fe1f5426f9dd545de4b27ee00",
            recipient: "a77f5cdfa2934df3954a5c7c7da5df1f",
            amount: 5
        )

        XCTAssertEqual(blockChain.currentTransactions.count, 1)
    }

    func test_createTransaction_returnNextIndex() {
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

        blockChain.chain.append(block)

        let index = blockChain.createTransaction(
            sender: "8527147fe1f5426f9dd545de4b27ee00",
            recipient: "a77f5cdfa2934df3954a5c7c7da5df1f",
            amount: 5
        )

        XCTAssertEqual(index, 2)
    }

    func test_lastBlock() {
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

        blockChain.chain.append(block)

        XCTAssertEqual(blockChain.lastBlock, block)
    }

    func test_createHash() {
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

        let hash = BlockChain.createHash(with: block)

        XCTAssertEqual(hash, "2cf24dba5fb0a30e26e83b2ac5b9e29e1b161e5c1fa7425e73043362938b9824".sha256)
    }
}
