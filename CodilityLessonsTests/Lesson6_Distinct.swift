//
//  Lesson6_Distinct.swift
//  CodilityLessons
//
//  Created by Oleksandr Malovichko on 4/4/17.
//  
//

import XCTest

class Lesson6_Distinct: XCTestCase {
    
    func test() {
        var arr = [1, 2, 3, 1]
        XCTAssertEqual(solution(&arr), 3)
    }
    
    public func solution(_ A : inout [Int]) -> Int {
        return Set(A).count
    }
    
}
