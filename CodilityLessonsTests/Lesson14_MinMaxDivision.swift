//
//  Lesson14_MinMaxDivision.swift
//  CodilityLessonsTests
//
//  Created by Oleksandr Malovichko on 23.06.2019.
//

import XCTest

/*
 MinMaxDivision
 Divide array A into K blocks and minimize the largest sum of any block.
 
 
 You are given integers K, M and a non-empty array A consisting of N integers. Every element of the array is not greater than M.
 
 You should divide this array into K blocks of consecutive elements. The size of the block is any integer between 0 and N. Every element of the array should belong to some block.
 
 The sum of the block from X to Y equals A[X] + A[X + 1] + ... + A[Y]. The sum of empty block equals 0.
 
 The large sum is the maximal sum of any block.
 
 For example, you are given integers K = 3, M = 5 and array A such that:
 
 A[0] = 2
 A[1] = 1
 A[2] = 5
 A[3] = 1
 A[4] = 2
 A[5] = 2
 A[6] = 2
 The array can be divided, for example, into the following blocks:
 
 [2, 1, 5, 1, 2, 2, 2], [], [] with a large sum of 15;
 [2], [1, 5, 1, 2], [2, 2] with a large sum of 9;
 [2, 1, 5], [], [1, 2, 2, 2] with a large sum of 8;
 [2, 1], [5, 1], [2, 2, 2] with a large sum of 6.
 The goal is to minimize the large sum. In the above example, 6 is the minimal large sum.
 
 Write a function:
 
 public func solution(_ K : Int, _ M : Int, _ A : inout [Int]) -> Int
 that, given integers K, M and a non-empty array A consisting of N integers, returns the minimal large sum.
 
 For example, given K = 3, M = 5 and array A such that:
 
 A[0] = 2
 A[1] = 1
 A[2] = 5
 A[3] = 1
 A[4] = 2
 A[5] = 2
 A[6] = 2
 the function should return 6, as explained above.
 
 Write an efficient algorithm for the following assumptions:
 
 N and K are integers within the range [1..100,000];
 M is an integer within the range [0..10,000];
 each element of array A is an integer within the range [0..M].
 */

class Lesson14_MinMaxDivision: XCTestCase {
    
    func test() {
        var a = [Int]()
        
//        a = [8, 5, 3, 4, 6, 8]
//        XCTAssertEqual(solution(&a), 6)
//
//        a = [1, 4, -3]
//        XCTAssertEqual(solution(&a), 1)
//
//        a = [-8, 4, 5, -10, 3]
//        XCTAssertEqual(solution(&a), 3)
//
//        a = [0]
//        XCTAssertEqual(solution(&a), 0)
    }
    
//    func testPerformance() {
//        var a = [Int]()
//        for i in -50_000...50_000 {
//            a.append(i)
//        }
//        measure {
//            _ = solution(&a)
//        }
//    }
    
    public func solution(_ K : Int, _ M : Int, _ A : inout [Int]) -> Int {
        return 0
    }
}
