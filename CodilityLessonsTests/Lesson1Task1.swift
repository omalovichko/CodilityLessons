//
//  Lesson1Task1.swift
//  CodilityLessons
//
//  Created by Oleksandr Malovichko on 3/21/17.
//  
//

import XCTest

class Lesson1Task1: XCTestCase {
    
    func test() {
        XCTAssertEqual(solution(1041), 5)
    }
    
    public func solution(_ N : Int) -> Int {
        let str = String(N, radix: 2)
        
        var maxLength = 0
        var length = 0
        
        for c in str.characters {
            if c ==  "0" {
                length += 1
            } else {
                maxLength = max(maxLength, length)
                length = 0
            }
        }
        return maxLength
    }
    
}
