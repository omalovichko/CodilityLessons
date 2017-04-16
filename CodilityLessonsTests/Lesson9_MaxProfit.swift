//
//  Lesson9_MaxProfit.swift
//  CodilityLessons
//
//  Created by Oleksandr Malovichko on 4/13/17.
//
//

import XCTest

class Lesson9_MaxProfit: XCTestCase {
    
    func test() {
        var arr = [23171, 21011, 21123, 21366, 21013, 21367]
        XCTAssertEqual(solution(&arr), 356)
    }

    public func solution(_ A : inout [Int]) -> Int {
        var profit = 0
        var sharePrice = Int.max
        for price in A {
            if price < sharePrice {
                sharePrice = price
            } else {
                profit = max(profit, price - sharePrice)
            }
        }
        return profit
    }
    
}
