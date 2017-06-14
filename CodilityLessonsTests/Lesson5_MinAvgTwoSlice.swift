//
//  L5_3.swift
//  CodilityLessons
//
//  Created by Oleksandr Malovichko on 3/30/17.
//  
//

import XCTest

class Lesson5_MinAvgTwoSlice: XCTestCase {
    
    func test() {
        var arr = [4, 2, 2, 5, 1, 5, 8]
        XCTAssertEqual(solution(&arr), 1)
    }
    
    public func solution(_ A : inout [Int]) -> Int {
        let count = A.count
        if count == 2 {
            return 0
        }
        var sliceMinIndex = 0
        var sliceMinAvg = Double(Int.max)
        for i in 0...count - 2 {
            let slice2 = A[i] + A[i + 1]
            let slice3 = i < count - 2 ? (slice2 + A[i + 2]) : Int.max
            let avg = min(Double(slice2) / 2.0, Double(slice3) / 3.0)
            if avg < sliceMinAvg {
                sliceMinIndex = i
                sliceMinAvg = avg
            }
        }
        return sliceMinIndex
    }
    
}
