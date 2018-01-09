//
//  Block.swift
//  BlockChain
//
//  Created by shindyu on 2018/01/09.
//  Copyright © 2018年 shindyu. All rights reserved.
//

import Foundation

struct Block {
    let index: Int
    let timestamp: Double
    let transactions: [Transaction]
    let proof: Int
    let previousHash: String
}
