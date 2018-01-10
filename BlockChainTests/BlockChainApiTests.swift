//
//  BlockChainServerTests.swift
//  BlockChainTests
//
//  Created by shindyu on 2018/01/11.
//  Copyright © 2018年 shindyu. All rights reserved.
//

import XCTest
@testable import BlockChain

// 返却内容はsampleに従う
// https://qiita.com/hidehiro98/items/841ece65d896aeaa8a2a
class BlockChainApiTests: XCTestCase {
    var api: BlockChainApi!

    override func setUp() {
        super.setUp()

        api = BlockChainApi(dateProvider: FakeDateProvider())
    }

    func test_createTransaction() {
        let response = api.createTransaction(
            sender: "my address",
            recipient: "someone else's address",
            amount: 5
        )

        let jsonObject = ["message": "トランザクションはブロック{2}に追加されました"]
        let jsonData = try! JSONSerialization.data(withJSONObject: jsonObject, options: [])
        let expectedJson = String(bytes: jsonData, encoding: .utf8)!

        XCTAssertEqual(response, expectedJson)
    }

    func test_mine() {
        let response = api.mine()

        let transaction = Transaction(
            sender: "0",
            recipient: "miner",
            amount: 1
        )
        let block = Block(
            index: 2,
            timestamp: FakeDateProvider().timestamp(),
            transactions: [transaction],
            proof: 35293,
            previousHash: "6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b"
        )
        let data = try! JSONEncoder().encode(block)
        let expectedJson = String(data: data, encoding: .utf8)!

        XCTAssertEqual(response, expectedJson)
    }

    func test_chain() {
        let chain = api.fullChain()

        //        TODO: expectedChain
//        XCTAssertEqual(chain, expectedChain)
    }
}
