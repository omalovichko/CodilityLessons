//
//  Lesson15_CountTriangles.swift
//  CodilityLessonsTests
//
//  Created by Oleksandr Malovichko on 22.06.2019.
//

import XCTest

/*
 CountTriangles
 Count the number of triangles that can be built from a given set of edges.
 
 
 An array A consisting of N integers is given. A triplet (P, Q, R) is triangular if it is possible to build a triangle with sides of lengths A[P], A[Q] and A[R]. In other words, triplet (P, Q, R) is triangular if 0 ≤ P < Q < R < N and:
 
 A[P] + A[Q] > A[R],
 A[Q] + A[R] > A[P],
 A[R] + A[P] > A[Q].
 For example, consider array A such that:
 
 A[0] = 10    A[1] = 2    A[2] = 5
 A[3] = 1     A[4] = 8    A[5] = 12
 There are four triangular triplets that can be constructed from elements of this array, namely (0, 2, 4), (0, 2, 5), (0, 4, 5), and (2, 4, 5).
 
 Write a function:
 
 public func solution(_ A : inout [Int]) -> Int
 that, given an array A consisting of N integers, returns the number of triangular triplets in this array.
 
 For example, given array A such that:
 
 A[0] = 10    A[1] = 2    A[2] = 5
 A[3] = 1     A[4] = 8    A[5] = 12
 the function should return 4, as explained above.
 
 Write an efficient algorithm for the following assumptions:
 
 N is an integer within the range [0..1,000];
 each element of array A is an integer within the range [1..1,000,000,000].
*/

class Lesson15_CountTriangles: XCTestCase {
    
    func test() {
        var a = [Int]()
        
        a = [10, 2, 5, 1, 8, 12]
        XCTAssertEqual(solution(&a), 4)
    }
    
    func testPerformance() {
        var a = [Int]()
        for i in 0..<200 {
            a.append(i)
        }
        measure {
            _ = solution(&a)
        }
    }
    
    public func solution(_ A : inout [Int]) -> Int {
        guard A.count > 2 else {
            return 0
        }
        let sorted = A.sorted(by: { (l, r) -> Bool in
            return l < r
        })
        var result = 0
        for aIndex in 0..<sorted.count - 2 {
            let a = sorted[aIndex]
            var cIndex = aIndex + 2
            for bIndex in aIndex + 1..<sorted.count - 1 {
                let b = sorted[bIndex]
                let ab = a + b
                while cIndex < sorted.count && ab > sorted[cIndex] {
                    cIndex += 1
                }
                result += cIndex - bIndex - 1
            }
        }
        return result
    }
    
}
