//
//  Lesson2_CyclicRotation.swift
//  CodilityLessons
//
//  Created by Oleksandr Malovichko on 3/23/17.
//  
//

import XCTest

/*
 CyclicRotation
 Rotate an array to the right by a given number of steps.
 
 
 An array A consisting of N integers is given. Rotation of the array means that each element is shifted right by one index, and the last element of the array is moved to the first place. For example, the rotation of array A = [3, 8, 9, 7, 6] is [6, 3, 8, 9, 7] (elements are shifted right by one index and 6 is moved to the first place).
 
 The goal is to rotate array A K times; that is, each element of A will be shifted to the right K times.
 
 Write a function:
 
 public func solution(_ A : inout [Int], _ K : Int) -> [Int]
 
 that, given an array A consisting of N integers and an integer K, returns the array A rotated K times.
 
 For example, given
 
 A = [3, 8, 9, 7, 6]
 K = 3
 the function should return [9, 7, 6, 3, 8]. Three rotations were made:
 
 [3, 8, 9, 7, 6] -> [6, 3, 8, 9, 7]
 [6, 3, 8, 9, 7] -> [7, 6, 3, 8, 9]
 [7, 6, 3, 8, 9] -> [9, 7, 6, 3, 8]
 For another example, given
 
 A = [0, 0, 0]
 K = 1
 the function should return [0, 0, 0]
 
 Given
 
 A = [1, 2, 3, 4]
 K = 4
 the function should return [1, 2, 3, 4]
 
 Assume that:
 
 N and K are integers within the range [0..100];
 each element of array A is an integer within the range [−1,000..1,000].
 In your solution, focus on correctness. The performance of your solution will not be the focus of the assessment.
*/

class Lesson2_CyclicRotation: XCTestCase {
    
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
