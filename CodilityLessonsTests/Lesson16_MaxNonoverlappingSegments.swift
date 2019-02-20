//
//  Lesson16_MaxNonoverlappingSegments.swift
//  CodilityLessons
//
//  Created by Oleksandr Malovichko on 4/20/17.
//
//

import XCTest

/*
 MaxNonoverlappingSegments
 Find a maximal set of non-overlapping segments.
 
 
 Located on a line are N segments, numbered from 0 to N − 1, whose positions are given in arrays A and B. For each I (0 ≤ I < N) the position of segment I is from A[I] to B[I] (inclusive). The segments are sorted by their ends, which means that B[K] ≤ B[K + 1] for K such that 0 ≤ K < N − 1.
 
 Two segments I and J, such that I ≠ J, are overlapping if they share at least one common point. In other words, A[I] ≤ A[J] ≤ B[I] or A[J] ≤ A[I] ≤ B[J].
 
 We say that the set of segments is non-overlapping if it contains no two overlapping segments. The goal is to find the size of a non-overlapping set containing the maximal number of segments.
 
 For example, consider arrays A, B such that:
 
 A[0] = 1    B[0] = 5
 A[1] = 3    B[1] = 6
 A[2] = 7    B[2] = 8
 A[3] = 9    B[3] = 9
 A[4] = 9    B[4] = 10
 The segments are shown in the figure below.
 
 
 
 The size of a non-overlapping set containing a maximal number of segments is 3. For example, possible sets are {0, 2, 3}, {0, 2, 4}, {1, 2, 3} or {1, 2, 4}. There is no non-overlapping set with four segments.
 
 Write a function:
 
 public func solution(_ A : inout [Int], _ B : inout [Int]) -> Int
 that, given two arrays A and B consisting of N integers, returns the size of a non-overlapping set containing a maximal number of segments.
 
 For example, given arrays A, B shown above, the function should return 3, as explained above.
 
 Write an efficient algorithm for the following assumptions:
 
 N is an integer within the range [0..30,000];
 each element of arrays A, B is an integer within the range [0..1,000,000,000];
 A[I] ≤ B[I], for each I (0 ≤ I < N);
 B[K] ≤ B[K + 1], for each K (0 ≤ K < N − 1).
*/

class Lesson16_MaxNonoverlappingSegments: XCTestCase {
    
    func test() {
        var a = [Int]()
        var b = [Int]()

        a = [1, 3, 7, 9, 9]
        b = [5, 6, 8, 9, 10]
        XCTAssertEqual(solution(&a, &b), 3)
        
        a = [0]
        b = [0]
        XCTAssertEqual(solution(&a, &b), 1)
    }
    
    public func solution(_ A : inout [Int], _ B : inout [Int]) -> Int {
        let count = A.count
        
        if count == 0 {
            return 0
        }
        
        var segmentsCount = 1
        var lastMinPoint = Int.max
        
        for i in 0..<count {   
            let a = A[i]
            let b = B[i]
            
            if lastMinPoint < a {
                segmentsCount += 1
                lastMinPoint = b
            } else {
                lastMinPoint = min(lastMinPoint, b)
            }
        }
        
        return segmentsCount
    }

}
