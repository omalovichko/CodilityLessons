//
//  L4_3.swift
//  CodilityLessons
//
//  Created by Oleksandr Malovichko on 3/29/17.
//  
//

import XCTest

class Lesson4Task3: XCTestCase {
    
    func test() {
        var arr = [1, 3, 1, 4, 2, 3, 5, 4]
        XCTAssertEqual(solution(5, &arr), 6)
        
        var arr2 = [1]
        XCTAssertEqual(solution(2, &arr2), -1)
        
        var arr3 = [2]
        XCTAssertEqual(solution(2, &arr3), -1)
        
        var arr4 = [1]
        XCTAssertEqual(solution(1, &arr4), 0)
    }
    
    public func solution(_ X : Int, _ A : inout [Int]) -> Int {
        let count = A.count
        if X > count {
            return -1
        }
        
        var set = Set<Int>()
        var setCount = 0
        var index = 0
        
        for e in A {
            if !set.contains(e) && e <= X {
                set.insert(e)
                setCount += 1
            }
            
            if setCount == X {
                return index
            }
            
            index += 1
        }
        
        return -1
    }
    
}
