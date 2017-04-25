//
//  Lesson3_PermMissingElem.swift
//  CodilityLessons
//
//  Created by Oleksandr Malovichko on 3/27/17.
//  
//

import XCTest

class Lesson3_PermMissingElem: XCTestCase {
    
    func test() {
        var arr = [2, 3, 1, 5]
        XCTAssertEqual(solution(&arr), 4)
        
        var arr2 = [2]
        XCTAssertEqual(solution(&arr2), 1)
    }
    
    public func solution(_ A : inout [Int]) -> Int {
        let count = A.count
        
        if count == 0 {
            return 1
        }
        
        let gaussSum = ((count + 1) * ((count + 1) + 1)) / 2
        let sum = A.reduce(0, +)
        return gaussSum - sum
    }
    
}
