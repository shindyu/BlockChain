//
//  BlockChainServerTests.swift
//  BlockChainTests
//
//  Created by shindyu on 2018/01/11.
//  Copyright © 2018年 shindyu. All rights reserved.
//

import XCTest
@testable import BlockChain

// endpointなのでjsonでresponseを返却する。
// 返却内容はsampleに従う
// https://qiita.com/hidehiro98/items/841ece65d896aeaa8a2a
class BlockChainApiTests: XCTestCase {
    func test_createTransaction() {
        let api = BlockChainApi()

        api.createTransaction()
    }
    func test_mine() {
        let api = BlockChainApi()

        api.mine()
    }
    func test_chain() {
        let api = BlockChainApi()

        api.fullChain()
    }
}
