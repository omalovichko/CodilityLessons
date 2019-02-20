//
//  Lesson8_Dominator.swift
//  CodilityLessons
//
//  Created by Oleksandr Malovichko on 4/12/17.
//
//

import XCTest

/*
 Dominator
 Find an index of an array such that its value occurs at more than half of indices in the array.
 
 
 An array A consisting of N integers is given. The dominator of array A is the value that occurs in more than half of the elements of A.
 
 For example, consider array A such that
 
 A[0] = 3    A[1] = 4    A[2] =  3
 A[3] = 2    A[4] = 3    A[5] = -1
 A[6] = 3    A[7] = 3
 The dominator of A is 3 because it occurs in 5 out of 8 elements of A (namely in those with indices 0, 2, 4, 6 and 7) and 5 is more than a half of 8.
 
 Write a function
 
 public func solution(_ A : inout [Int]) -> Int
 that, given an array A consisting of N integers, returns index of any element of array A in which the dominator of A occurs. The function should return −1 if array A does not have a dominator.
 
 For example, given array A such that
 
 A[0] = 3    A[1] = 4    A[2] =  3
 A[3] = 2    A[4] = 3    A[5] = -1
 A[6] = 3    A[7] = 3
 the function may return 0, 2, 4, 6 or 7, as explained above.
 
 Write an efficient algorithm for the following assumptions:
 
 N is an integer within the range [0..100,000];
 each element of array A is an integer within the range [−2,147,483,648..2,147,483,647].
*/

class Lesson8_Dominator: XCTestCase {
    
    func test() {
        var arr = [3, 4, 3, 2, 3, -1, 3, 3]
        XCTAssert(arr[solution(&arr)] == 3)
    }
    
    public func solution(_ A : inout [Int]) -> Int {
        let count = A.count
        if count == 0 || count == 2 {
            return -1
        }
        if count == 1 {
            return 0
        }
        
        var size = 0
        var candidate = (value: 0, index: 0)
        for i in 0..<count {
            if size == 0 {
                candidate = (A[i], i)
                size += 1
            } else {
                if candidate.value != A[i] {
                    size -= 1
                } else {
                    size += 1
                }
            }
        }
        
        if size <= 0 {
            return -1
        }
        
        let elements = A.filter { (v) -> Bool in
            return v == candidate.value
        }.count
        
        return elements >= count / 2 + 1 ? candidate.index : -1
    }

}
