//
//  L2_2.swift
//  CodilityLessons
//
//  Created by Oleksandr Malovichko on 3/23/17.
//  
//

import XCTest

class Lesson2Task2: XCTestCase {
    
    func test() {
        var arr = [3, 8, 9, 7, 6]
        XCTAssertEqual(solution(&arr, 3), [9, 7, 6, 3, 8])
        XCTAssertEqual(solution(&arr, 3 + arr.count), [9, 7, 6, 3, 8])
        
        var emptyArr = [Int]()
        XCTAssertEqual(solution(&emptyArr, Int.max), [])
        
        var arr2 = [5, -1000]
        XCTAssertEqual(solution(&arr2, 1), [-1000, 5])
    }
    
    public func solution(_ A : inout [Int], _ K : Int) -> [Int] {
        let count = A.count
        
        if count == 0 {
            // Array is empty
            return []
        }
        
        if count == 1 {
            // K makes no sense
            return A
        }
        
        var shift = K
        if shift >= count {
            shift = shift % count
        }
        
        shift = count - shift
        
        var left = [Int]()
        var right = [Int]()
        
        var index = 0
        for e in A {
            if index < shift {
                left.append(e)
            } else {
                right.append(e)
            }
            index += 1
        }
        
        return right + left
    }
    
}
