//
//  FakeDateProvider.swift
//  BlockChainTests
//
//  Created by shindyu on 2018/01/09.
//  Copyright © 2018年 shindyu. All rights reserved.
//

import Foundation
@testable import BlockChain

struct FakeDateProvider: DateProvider {
    var constDate: Date {
        let fmt = DateFormatter()
        fmt.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return fmt.date(from: "2018-01-09 12:34:56")!
    }

    func timestamp() -> Double {
        return constDate.timeIntervalSince1970
    }
}
