//
//  Lesson16_TieRopes.swift
//  CodilityLessons
//
//  Created by Oleksandr Malovichko on 4/24/17.
//
//

import XCTest

class Lesson16_TieRopes: XCTestCase {
    
    func test() {
        var a = [Int]()
        
        a = [1, 2, 3, 4, 1, 1, 3]

        XCTAssertEqual(solution(4, &a), 3)
    }
    
    public func solution(_ K : Int, _ A : inout [Int]) -> Int {
        var ropesCount = 0
        
        var length = 0
        
        for i in 0..<A.count {
            let a = A[i]
            length += a
            if length >= K {
                ropesCount += 1
                length = 0
            }
        }
        
        return ropesCount
    }
}
