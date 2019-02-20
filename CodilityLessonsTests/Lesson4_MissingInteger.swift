//
//  Lesson4_MissingInteger.swift
//  CodilityLessons
//
//  Created by Oleksandr Malovichko on 3/28/17.
//  
//

import XCTest

/*
 MissingInteger
 Find the smallest positive integer that does not occur in a given sequence.
 
 
 Write a function:
 
 public func solution(_ A : inout [Int]) -> Int
 
 that, given an array A of N integers, returns the smallest positive integer (greater than 0) that does not occur in A.
 
 For example, given A = [1, 3, 6, 4, 1, 2], the function should return 5.
 
 Given A = [1, 2, 3], the function should return 4.
 
 Given A = [−1, −3], the function should return 1.
 
 Write an efficient algorithm for the following assumptions:
 
 N is an integer within the range [1..100,000];
 each element of array A is an integer within the range [−1,000,000..1,000,000].
*/

class Lesson4_MissingInteger: XCTestCase {
    
    func test() {
        var arr = [1, 3, 6, 4, 1, 2, -10]
        XCTAssertEqual(solution(&arr), 5)
        
        var arr2 = [1]
        XCTAssertEqual(solution(&arr2), 2)
        
        var arr3 = [2]
        XCTAssertEqual(solution(&arr3), 1)
    }
    
    public func solution(_ A : inout [Int]) -> Int {
        var arr = A.filter { (e) -> Bool in
            return e > 0
        }
        arr = arr.sorted(by: { (l, r) -> Bool in
            return l < r
        })
        var index = 1
        for e in arr {
            if e == index {
                index += 1
            } else if e < index {
                continue
            } else {
                return index
            }
        }
        return index
    }
    
}
