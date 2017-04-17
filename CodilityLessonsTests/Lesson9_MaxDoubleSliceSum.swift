//
//  Lesson9_MaxDoubleSliceSum.swift
//  CodilityLessons
//
//  Created by Oleksandr Malovichko on 4/14/17.
//
//

import XCTest

class Lesson9_MaxDoubleSliceSum: XCTestCase {
    
    func test() {
        var a = [Int]()
        
        a = [0, 1, -1, -1, 10, 0]
        XCTAssertEqual(solution(&a), 10)
        
        a = [0, 1, -2, -1, 10, 0]
        XCTAssertEqual(solution(&a), 10)
        
        a = [0, 1, -1, -2, 10, -10, 100, 0]
        XCTAssertEqual(solution(&a), 110)
        
        a = [0, 7, -1, -1, -2, -1, -1, 10, 0]
        XCTAssertEqual(solution(&a), 13)
        
        a = [3, 2, 6, -20, 4, 5, -1, 2]
        XCTAssertEqual(solution(&a), 8 + 9)
        
        a = [3, 2, 6, -1, 4, 5, -1, 2]
        XCTAssertEqual(solution(&a), 8 + 9)
        
        a = [3, 2, 6, -1, 4, 5, -1, -1, -1, -1, -1, -1, 2]
        XCTAssertEqual(solution(&a), 8 + 9)
        
        a = [1, 2, -1, 2, 1]
        XCTAssertEqual(solution(&a), 4)
        
        a = [0, 2, -20, -20, 2, 0]
        XCTAssertEqual(solution(&a), 2)
        
        a = [6, 1, 5, 6, 4, 2, 9, 4]
        XCTAssertEqual(solution(&a), 26)
        
        a = [0, -100, 1, 0]
        XCTAssertEqual(solution(&a), 1)
        
        a = [0, 1, -100, 0]
        XCTAssertEqual(solution(&a), 1)
        
        a = [0, 0, 1, 0]
        XCTAssertEqual(solution(&a), 1)
        
        a = [0, -100, -100, -100, 1, -100, -100, -100, 0]
        XCTAssertEqual(solution(&a), 1)
    }
    
    public func solution(_ A : inout [Int]) -> Int {
        let count = A.count
        
        if count == 3 {
            return 0
        }
        
        var left = [Int](repeatElement(0, count: count))
        var right = [Int](repeatElement(0, count: count))
        
        for i in 1..<count {
            left[i] = max(A[i] + left[i - 1], 0)
            right[count - i - 1] = max(A[count - i - 1] + right[count - i], 0)
        }
        
        var solution = 0
        for i in 1..<count - 1 {
            solution = max(solution, left[i - 1] + right[i + 1])
        }
        
        return solution
    }
}
