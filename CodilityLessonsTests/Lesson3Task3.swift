//
//  L3_3.swift
//  CodilityLessons
//
//  Created by Oleksandr Malovichko on 3/28/17.
//  Copyright © 2017 MAG. All rights reserved.
//

import XCTest

class L3_3: XCTestCase {
    
    func test() {
        var arr = [3, 1, 2, 4, 3]
        XCTAssertEqual(solution(&arr), 1)
        
        var arr2 = [1, 1]
        XCTAssertEqual(solution(&arr2), 0)
    }
    
    public func solution(_ A : inout [Int]) -> Int {
        var minDif = Int.max
        var leftSum = A.first!
        var rightSum = A.reduce(0, +) - leftSum
        var index = 0
        for item in A {
            if index == 0 {
                index = 1
                continue
            }
            
            let dif = leftSum - rightSum
            minDif = min(abs(minDif), abs(dif))
            
            leftSum += item
            rightSum -= item
            index += 1
        }
        return minDif
    }
    
}
