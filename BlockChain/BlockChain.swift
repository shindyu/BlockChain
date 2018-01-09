//
//  BlockChain.swift
//  BlockChain
//
//  Created by shindyu on 2018/01/09.
//  Copyright © 2018年 shindyu. All rights reserved.
//

import Foundation

class BlockChain {
    var chain: [Block] = []
    var currentTransaction: [Transaction] = []
    var lastBlock: Block {
        get {
            return chain.last!
        }
    }

    func createBlock() {
        chain.append(
            Block(
                index: 1,
                timestamp: 1506057125.900785,
                transactions: [],
                proof: 324984774000,
                previousHash: "2cf24dba5fb0a30e26e83b2ac5b9e29e1b161e5c1fa7425e73043362938b9824"
            )
        )
    }

    func createTransaction(sender: String, recipient: String, amount: Int) -> Int {
        currentTransaction.append(
            Transaction(
                sender: "8527147fe1f5426f9dd545de4b27ee00",
                recipient: "a77f5cdfa2934df3954a5c7c7da5df1f",
                amount: 5
            )
        )
        return chain.isEmpty ? 1 : lastBlock.index + 1
    }
}
