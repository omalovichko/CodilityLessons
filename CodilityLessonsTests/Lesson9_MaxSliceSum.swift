//
//  Lesson9_MaxSliceSum.swift
//  CodilityLessons
//
//  Created by Oleksandr Malovichko on 4/13/17.
//
//

import XCTest

class Lesson9_MaxSliceSum: XCTestCase {
    
    func test() {
        var arr = [3, 2, -6, 4, 0]
        XCTAssertEqual(solution(&arr), 5)
        
        var arr1 = [-1_000_000, -1_000_000, -1_000_000, -1_000_000]
        XCTAssertEqual(solution(&arr1), -1_000_000)
        
        var arr2 = [-2, 1]
        XCTAssertEqual(solution(&arr2), 1)
    }
    
    public func solution(_ A : inout [Int]) -> Int {
        let count = A.count
        if count == 1 {
            return A.first!
        }
        var maxEnding = 0
        var maxSlice = Int.min
        for i in 0..<count {
            maxEnding = max(A[i], maxEnding + A[i])
            maxSlice = max(maxSlice, maxEnding)
        }
        return maxSlice
    }
}
