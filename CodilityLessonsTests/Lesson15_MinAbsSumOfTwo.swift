//
//  Lesson15_MinAbsSumOfTwo.swift
//  CodilityLessonsTests
//
//  Created by Oleksandr Malovichko on 22.06.2019.
//

import XCTest

/*
 MinAbsSumOfTwo
 Find the minimal absolute value of a sum of two elements.
 
 
 Let A be a non-empty array consisting of N integers.
 
 The abs sum of two for a pair of indices (P, Q) is the absolute value |A[P] + A[Q]|, for 0 ≤ P ≤ Q < N.
 
 For example, the following array A:
 
 A[0] =  1
 A[1] =  4
 A[2] = -3
 has pairs of indices (0, 0), (0, 1), (0, 2), (1, 1), (1, 2), (2, 2).
 The abs sum of two for the pair (0, 0) is A[0] + A[0] = |1 + 1| = 2.
 The abs sum of two for the pair (0, 1) is A[0] + A[1] = |1 + 4| = 5.
 The abs sum of two for the pair (0, 2) is A[0] + A[2] = |1 + (−3)| = 2.
 The abs sum of two for the pair (1, 1) is A[1] + A[1] = |4 + 4| = 8.
 The abs sum of two for the pair (1, 2) is A[1] + A[2] = |4 + (−3)| = 1.
 The abs sum of two for the pair (2, 2) is A[2] + A[2] = |(−3) + (−3)| = 6.
 
 Write a function:
 
 public func solution(_ A : inout [Int]) -> Int
 that, given a non-empty array A consisting of N integers, returns the minimal abs sum of two for any pair of indices in this array.
 
 For example, given the following array A:
 
 A[0] =  1
 A[1] =  4
 A[2] = -3
 the function should return 1, as explained above.
 
 Given array A:
 
 A[0] = -8
 A[1] =  4
 A[2] =  5
 A[3] =-10
 A[4] =  3
 the function should return |(−8) + 5| = 3.
 
 Write an efficient algorithm for the following assumptions:
 
 N is an integer within the range [1..100,000];
 each element of array A is an integer within the range [−1,000,000,000..1,000,000,000].
 */

class Lesson15_MinAbsSumOfTwo: XCTestCase {
    
    func test() {
        var a = [Int]()
        
        a = [8, 5, 3, 4, 6, 8]
        XCTAssertEqual(solution(&a), 6)

        a = [1, 4, -3]
        XCTAssertEqual(solution(&a), 1)

        a = [-8, 4, 5, -10, 3]
        XCTAssertEqual(solution(&a), 3)
        
        a = [0]
        XCTAssertEqual(solution(&a), 0)
    }
    
    func testPerformance() {
        var a = [Int]()
        for i in -50_000...50_000 {
            a.append(i)
        }
        measure {
            _ = solution(&a)
        }
    }
    
    public func solution(_ A : inout [Int]) -> Int {
        let sorted = A.sorted()
        var minABS = Int.max
        var p = 0
        var q = sorted.count - 1
        repeat {
            let a = sorted[p]
            var minDif = Int.max
            var i = q
            repeat {
                let b = sorted[i]
                let dif = abs(b + a)
                if dif <= minDif {
                    minDif = dif
                } else {
                    break
                }
                i -= 1
            } while p <= i
            q = i + 1
            minABS = min(minABS, minDif)
            p += 1
        } while p <= q
        return minABS
    }
    
}
