//
//  L6_2.swift
//  CodilityLessons
//
//  Created by Oleksandr Malovichko on 4/4/17.
//  
//

import XCTest

class Lesson6Task2: XCTestCase {
    
    func test() {
        var arr = [-3, 1, 2, -2, 5, 6]
        XCTAssertEqual(solution(&arr), 60)
    }
    
    public func solution(_ A : inout [Int]) -> Int {
        let s = A.sorted()
        let i = s.count - 1
        return max(s[0] * s[1] * s[i], s[i - 2] * s[i - 1] * s[i])
    }
    
}
