//
//  Lesson6Task3.swift
//  CodilityLessons
//
//  Created by Oleksandr Malovichko on 4/5/17.
//
//

import XCTest

/*
 Triangle
 Determine whether a triangle can be built from a given set of edges.
 
 
 An array A consisting of N integers is given. A triplet (P, Q, R) is triangular if 0 ≤ P < Q < R < N and:
 
 A[P] + A[Q] > A[R],
 A[Q] + A[R] > A[P],
 A[R] + A[P] > A[Q].
 For example, consider array A such that:
 
 A[0] = 10    A[1] = 2    A[2] = 5
 A[3] = 1     A[4] = 8    A[5] = 20
 Triplet (0, 2, 4) is triangular.
 
 Write a function:
 
 public func solution(_ A : inout [Int]) -> Int
 
 that, given an array A consisting of N integers, returns 1 if there exists a triangular triplet for this array and returns 0 otherwise.
 
 For example, given array A such that:
 
 A[0] = 10    A[1] = 2    A[2] = 5
 A[3] = 1     A[4] = 8    A[5] = 20
 the function should return 1, as explained above. Given array A such that:
 
 A[0] = 10    A[1] = 50    A[2] = 5
 A[3] = 1
 the function should return 0.
 
 Write an efficient algorithm for the following assumptions:
 
 N is an integer within the range [0..100,000];
 each element of array A is an integer within the range [−2,147,483,648..2,147,483,647].
*/

class Lesson6_Triangle: XCTestCase {

    func test() {
        var arr = [10, 2, 5, 1, 8, 20]
        XCTAssertEqual(solution(&arr), 1)
        
        var arr2 = [10, 50, 5, 1]
        XCTAssertEqual(solution(&arr2), 0)
    }
    
    public func solution(_ A : inout [Int]) -> Int {
        let count = A.count
        if count < 3 {
            return 0
        }
        
        let sorted = A.sorted()
        
        for i in 0...count - 3 {
            if sorted[i] + sorted[i + 1] > sorted[i + 2] {
                return 1
            }
        }
        
        return 0
    }
}
