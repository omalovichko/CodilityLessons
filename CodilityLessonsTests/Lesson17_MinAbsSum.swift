//
//  Lesson17_MinAbsSum.swift
//  CodilityLessonsTests
//
//  Created by Oleksandr Malovichko on 7/5/18.
//

import XCTest

/*
 MinAbsSum
 Given array of integers, find the lowest absolute sum of elements.
 
 
 For a given array A of N integers and a sequence S of N integers from the set {−1, 1}, we define val(A, S) as follows:
 
 val(A, S) = |sum{ A[i]*S[i] for i = 0..N−1 }|
 (Assume that the sum of zero elements equals zero.)
 
 For a given array A, we are looking for such a sequence S that minimizes val(A,S).
 
 Write a function:
 
 public func solution(_ A : inout [Int]) -> Int
 that, given an array A of N integers, computes the minimum value of val(A,S) from all possible values of val(A,S) for all possible sequences S of N integers from the set {−1, 1}.
 
 For example, given array:
 
 A[0] =  1
 A[1] =  5
 A[2] =  2
 A[3] = -2
 your function should return 0, since for S = [−1, 1, −1, 1], val(A, S) = 0, which is the minimum possible value.
 
 Write an efficient algorithm for the following assumptions:
 
 N is an integer within the range [0..20,000];
 each element of array A is an integer within the range [−100..100].
*/

class Lesson17_MinAbsSum: XCTestCase {

    func test() {
        var a = [Int]()
        
        a = [1, 5, 2, -2]
        XCTAssertEqual(solution(&a), 0)
        
        a = [3, 3, 3, 4, 5]
        XCTAssertEqual(solution(&a), 0)
        
        a = [2, 2, 1]
        XCTAssertEqual(solution(&a), 1)
        
        a = [1, 5, -2, 5, 2, 3]
        XCTAssertEqual(solution(&a), 0)
    }

    func testPerfomance() {
        measure {
//            var a = Array<Int>(repeatElement(-100, count: 20_000))
            var a = Array<Int>(repeatElement(-100, count: 5_000))
            XCTAssertEqual(self.solution(&a), 0)
        }
    }
    
    public func solution(_ A : inout [Int]) -> Int {
        guard A.count > 0 else {
            return 0
        }
        
        var results = Set<Int>()
        var minimum = Int.max
                
        A.forEach { (value) in
            let absValue = abs(value)
            guard !results.isEmpty else {
                results.insert(absValue)
                minimum = absValue
                return
            }
            var nextResults = Set<Int>()
            var nextMinimum = Int.max
            results.forEach({ (result) in
                let add = abs(result - absValue)
                let subtract = abs(result + absValue)
                nextMinimum = min(min(add, subtract), nextMinimum)
                nextResults.insert(add)
                nextResults.insert(subtract)
            })
            results = nextResults
            minimum = nextMinimum
        }
        
        return minimum
    }
 
}
