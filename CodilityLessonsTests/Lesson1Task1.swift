//
//  Lesson1Task1.swift
//  CodilityLessons
//
//  Created by Oleksandr Malovichko on 3/21/17.
//  Copyright © 2017 MAG. All rights reserved.
//

import XCTest

class L1: XCTestCase {
    
    func testExample() {
        XCTAssertEqual(solution(1041), 5)
    }
    
    public func solution(_ N : Int) -> Int {
        let str = String(N, radix: 2)
        print(str)
        
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
    
    func getBytes(_ value: Int) -> [Int] {
        var bytes: [Int] = []
        
        var oper = value
        
        while oper >= 1 {
            let per = oper % 2
            bytes.insert(per, at: 0)
            
            oper -= per
            oper /= 2
        }
        
        return bytes
    }
 }
