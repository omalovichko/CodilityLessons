//
//  Lesson3_PermMissingElem.swift
//  CodilityLessons
//
//  Created by Oleksandr Malovichko on 3/27/17.
//  
//

import XCTest

/*
 PermMissingElem
 Find the missing element in a given permutation.
 
 
 An array A consisting of N different integers is given. The array contains integers in the range [1..(N + 1)], which means that exactly one element is missing.
 
 Your goal is to find that missing element.
 
 Write a function:
 
 public func solution(_ A : inout [Int]) -> Int
 
 that, given an array A, returns the value of the missing element.
 
 For example, given array A such that:
 
 A[0] = 2
 A[1] = 3
 A[2] = 1
 A[3] = 5
 the function should return 4, as it is the missing element.
 
 Write an efficient algorithm for the following assumptions:
 
 N is an integer within the range [0..100,000];
 the elements of A are all distinct;
 each element of array A is an integer within the range [1..(N + 1)].
*/

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
