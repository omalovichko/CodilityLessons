//
//  Lesson11_CountNonDivisible.swift
//  CodilityLessonsTests
//
//  Created by Oleksandr Malovichko on 15.06.2019.
//

import XCTest

/*
 CountNonDivisible
 Calculate the number of elements of an array that are not divisors of each element.
 
 
 You are given an array A consisting of N integers.
 
 For each number A[i] such that 0 ≤ i < N, we want to count the number of elements of the array that are not the divisors of A[i]. We say that these elements are non-divisors.
 
 For example, consider integer N = 5 and array A such that:
 
 A[0] = 3
 A[1] = 1
 A[2] = 2
 A[3] = 3
 A[4] = 6
 For the following elements:
 
 A[0] = 3, the non-divisors are: 2, 6,
 A[1] = 1, the non-divisors are: 3, 2, 3, 6,
 A[2] = 2, the non-divisors are: 3, 3, 6,
 A[3] = 3, the non-divisors are: 2, 6,
 A[4] = 6, there aren't any non-divisors.
 Write a function:
 
 public func solution(_ A : inout [Int]) -> [Int]
 that, given an array A consisting of N integers, returns a sequence of integers representing the amount of non-divisors.
 
 Result array should be returned as an array of integers.
 
 For example, given:
 
 A[0] = 3
 A[1] = 1
 A[2] = 2
 A[3] = 3
 A[4] = 6
 the function should return [2, 4, 3, 2, 0], as explained above.
 
 Write an efficient algorithm for the following assumptions:
 
 N is an integer within the range [1..50,000];
 each element of array A is an integer within the range [1..2 * N].
*/

class Lesson11_CountNonDivisible: XCTestCase {
    
    func test() {
        var a = [Int]()
        
        a = [3, 1, 2, 3, 6]
        XCTAssertEqual(solution(&a), [2, 4, 3, 2, 0])
    }
    
    public func solution(_ A : inout [Int]) -> [Int] {
        return []
    }
    
}
