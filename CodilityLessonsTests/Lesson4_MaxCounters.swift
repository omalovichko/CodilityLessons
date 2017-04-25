//
//  Lesson4_MaxCounters.swift
//  CodilityLessons
//
//  Created by Oleksandr Malovichko on 3/29/17.
//  
//

import XCTest

class Lesson4_MaxCounters: XCTestCase {
    
    func test() {
        var arr = [3, 4, 4, 6, 1, 4, 4]
        XCTAssertEqual(solution(5, &arr), [3, 2, 2, 4, 2])
        
        var arr2 = [1, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6]
        XCTAssertEqual(solution(5, &arr2), [1, 1, 1, 1, 1])
    }
    
    public func solution(_ N : Int, _ A : inout [Int]) -> [Int] {
        var result = Array<Int>.init(repeating: 0, count: N)
        var repeatedMaxValue = 0
        var maxValue = 0
        for e in A {
            if e <= N {
                result[e - 1] += 1
                maxValue = max(result[e - 1], maxValue)
            } else if maxValue > repeatedMaxValue {
                result = Array<Int>.init(repeating: maxValue, count: N)
                repeatedMaxValue = maxValue
            }
        }
        return result
    }
    
}
