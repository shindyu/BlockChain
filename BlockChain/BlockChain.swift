//
//  BlockChain.swift
//  BlockChain
//
//  Created by shindyu on 2018/01/09.
//  Copyright © 2018年 shindyu. All rights reserved.
//

import Foundation

class BlockChain {
    let dateProvider: DateProvider
    var chain: [Block] = []
    var currentTransactions: [Transaction] = []

    init(dateProvider: DateProvider) {
        self.dateProvider = dateProvider
        self.chain = []
        self.currentTransactions = []

        createBlock(proof: 100, previousHash: "1")
    }

    var lastBlock: Block {
        get {
            return chain.last!
        }
    }

    func createBlock(proof: Int, previousHash: String?) {
        chain.append(
            Block(
                index: chain.count + 1,
                timestamp: dateProvider.timestamp(),
                transactions: currentTransactions,
                proof: proof,
                previousHash: previousHash ?? BlockChain.createHash(with: lastBlock)
            )
        )

        currentTransactions = []
    }

    func createTransaction(sender: String, recipient: String, amount: Int) -> Int {
        currentTransactions.append(
            Transaction(
                sender: sender,
                recipient: recipient,
                amount: amount
            )
        )
        return lastBlock.index + 1
    }

    static func createHash(with block: Block) -> String {
        return block.previousHash.sha256
    }
}
