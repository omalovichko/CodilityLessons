//
//  Lesson17_NumberSolitaire.swift
//  CodilityLessons
//
//  Created by Oleksandr Malovichko on 4/25/17.
//
//

import XCTest

class Lesson17_NumberSolitaire: XCTestCase {
    
    func test() {
        var a = [Int]()
        
        a = [-5, -3, -10]
        XCTAssertEqual(solution(&a), -15)
        
        a = [0, -5, -5, -5, -5, -4, -5, -5, -5, -5, -5, -5, 100]
        XCTAssertEqual(solution(&a), 95)
        
        a = [1, 3]
        XCTAssertEqual(solution(&a), 4)
        
        a = [0, -1, 3]
        XCTAssertEqual(solution(&a), 3)
        
        a = [1, -2, 0, 9, -1, -2]
        XCTAssertEqual(solution(&a), 8)
    }
    
    public func solution(_ A : inout [Int]) -> Int {
        let count = A.count
        
        var sums = Dictionary<Int, Int>(minimumCapacity: count)
        
        for i in 0..<count - 1 {
            let leftSum: Int
            if let s = sums[i] {
                leftSum = s
            } else {
                leftSum = A[i]
            }
            
            for j in (i + 1)..<min(count, i + 7) {
                let b = A[j]
                
                if let sum = sums[j] {
                    sums[j] = max(sum, leftSum + b)
                } else {
                    sums[j] = leftSum + b
                }
            }
        }
        
        return sums[count - 1]!
    }
}
