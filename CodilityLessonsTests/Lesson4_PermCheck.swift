//
//  Lesson4_PermCheck.swift
//  CodilityLessons
//
//  Created by Oleksandr Malovichko on 3/29/17.
//  
//

import XCTest

/*
 PermCheck
 Check whether array A is a permutation.
 
 
 A non-empty array A consisting of N integers is given.
 
 A permutation is a sequence containing each element from 1 to N once, and only once.
 
 For example, array A such that:
 
 A[0] = 4
 A[1] = 1
 A[2] = 3
 A[3] = 2
 is a permutation, but array A such that:
 
 A[0] = 4
 A[1] = 1
 A[2] = 3
 is not a permutation, because value 2 is missing.
 
 The goal is to check whether array A is a permutation.
 
 Write a function:
 
 public func solution(_ A : inout [Int]) -> Int
 
 that, given an array A, returns 1 if array A is a permutation and 0 if it is not.
 
 For example, given array A such that:
 
 A[0] = 4
 A[1] = 1
 A[2] = 3
 A[3] = 2
 the function should return 1.
 
 Given array A such that:
 
 A[0] = 4
 A[1] = 1
 A[2] = 3
 the function should return 0.
 
 Write an efficient algorithm for the following assumptions:
 
 N is an integer within the range [1..100,000];
 each element of array A is an integer within the range [1..1,000,000,000].
*/

class Lesson4_PermCheck: XCTestCase {
    
    func test() {
        var arr = [4, 1, 3, 2]
        XCTAssertEqual(solution(&arr), 1)
        
        var arr2 = [4, 1, 3]
        XCTAssertEqual(solution(&arr2), 0)
        
        var arr3 = [1]
        XCTAssertEqual(solution(&arr3), 1)
        
        var arr4 = [2]
        XCTAssertEqual(solution(&arr4), 0)
        
        var arr5 = [4, 1, 3, 2, 4]
        XCTAssertEqual(solution(&arr5), 0)
    }
    
    public func solution(_ A : inout [Int]) -> Int {
        var sum = 0
        var set = Set<Int>()
        for e in A {
            if set.contains(e) {
                return 0
            }
            set.insert(e)
            sum += e
        }
        
        let count = A.count
        let gaussSum = (count * (count + 1)) / 2
        
        let result = gaussSum - sum
        
        return result == 0 ? 1 : 0
    }
    
}
