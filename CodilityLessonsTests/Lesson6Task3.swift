//
//  Lesson6Task3.swift
//  CodilityLessons
//
//  Created by Oleksandr Malovichko on 4/5/17.
//
//

import XCTest

class Lesson6Task3: XCTestCase {

    func test() {
        var arr = [10, 2, 5, 1, 8, 20]
        XCTAssertEqual(solution(&arr), 1)
        
        var arr2 = [10, 50, 5, 1]
        XCTAssertEqual(solution(&arr2), 0)
    }
    
    public func solution(_ A : inout [Int]) -> Int {
        let count = A.count
        if count < 3 {
            return 0
        }
        
        let sorted = A.sorted()
        
        for i in 0...count - 3 {
            if sorted[i] + sorted[i + 1] > sorted[i + 2] {
                return 1
            }
        }
        
        return 0
    }
}
