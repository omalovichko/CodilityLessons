//
//  L4_1.swift
//  CodilityLessons
//
//  Created by Oleksandr Malovichko on 3/28/17.
//  Copyright © 2017 MAG. All rights reserved.
//

import XCTest

class L4_1: XCTestCase {
    
    func test() {
        var arr = [1, 3, 6, 4, 1, 2, -10]
        XCTAssertEqual(solution(&arr), 5)
        
        var arr2 = [1]
        XCTAssertEqual(solution(&arr2), 2)
        
        var arr3 = [2]
        XCTAssertEqual(solution(&arr3), 1)
    }
    
    public func solution(_ A : inout [Int]) -> Int {
        var arr = A.filter { (e) -> Bool in
            return e > 0
        }
        arr = arr.sorted(by: { (l, r) -> Bool in
            return l < r
        })
        var index = 1
        for e in arr {
            if e == index {
                index += 1
            } else if e < index {
                continue
            } else {
                return index
            }
        }
        return index
    }
}
