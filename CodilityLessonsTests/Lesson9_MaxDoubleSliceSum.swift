//
//  Lesson9_MaxDoubleSliceSum.swift
//  CodilityLessons
//
//  Created by Oleksandr Malovichko on 4/14/17.
//
//

import XCTest

/*
 MaxDoubleSliceSum
 Find the maximal sum of any double slice.
 
 
 A non-empty array A consisting of N integers is given.
 
 A triplet (X, Y, Z), such that 0 ≤ X < Y < Z < N, is called a double slice.
 
 The sum of double slice (X, Y, Z) is the total of A[X + 1] + A[X + 2] + ... + A[Y − 1] + A[Y + 1] + A[Y + 2] + ... + A[Z − 1].
 
 For example, array A such that:
 
 A[0] = 3
 A[1] = 2
 A[2] = 6
 A[3] = -1
 A[4] = 4
 A[5] = 5
 A[6] = -1
 A[7] = 2
 contains the following example double slices:
 
 double slice (0, 3, 6), sum is 2 + 6 + 4 + 5 = 17,
 double slice (0, 3, 7), sum is 2 + 6 + 4 + 5 − 1 = 16,
 double slice (3, 4, 5), sum is 0.
 The goal is to find the maximal sum of any double slice.
 
 Write a function:
 
 public func solution(_ A : inout [Int]) -> Int
 
 that, given a non-empty array A consisting of N integers, returns the maximal sum of any double slice.
 
 For example, given:
 
 A[0] = 3
 A[1] = 2
 A[2] = 6
 A[3] = -1
 A[4] = 4
 A[5] = 5
 A[6] = -1
 A[7] = 2
 the function should return 17, because no double slice of array A has a sum of greater than 17.
 
 Write an efficient algorithm for the following assumptions:
 
 N is an integer within the range [3..100,000];
 each element of array A is an integer within the range [−10,000..10,000].
*/

class Lesson9_MaxDoubleSliceSum: XCTestCase {
    
    func test() {
        var a = [Int]()
        
        a = [0, 1, -1, -1, 10, 0]
        XCTAssertEqual(solution(&a), 10)
        
        a = [0, 1, -2, -1, 10, 0]
        XCTAssertEqual(solution(&a), 10)
        
        a = [0, 1, -1, -2, 10, -10, 100, 0]
        XCTAssertEqual(solution(&a), 110)
        
        a = [0, 7, -1, -1, -2, -1, -1, 10, 0]
        XCTAssertEqual(solution(&a), 13)
        
        a = [3, 2, 6, -20, 4, 5, -1, 2]
        XCTAssertEqual(solution(&a), 8 + 9)
        
        a = [3, 2, 6, -1, 4, 5, -1, 2]
        XCTAssertEqual(solution(&a), 8 + 9)
        
        a = [3, 2, 6, -1, 4, 5, -1, -1, -1, -1, -1, -1, 2]
        XCTAssertEqual(solution(&a), 8 + 9)
        
        a = [1, 2, -1, 2, 1]
        XCTAssertEqual(solution(&a), 4)
        
        a = [0, 2, -20, -20, 2, 0]
        XCTAssertEqual(solution(&a), 2)
        
        a = [6, 1, 5, 6, 4, 2, 9, 4]
        XCTAssertEqual(solution(&a), 26)
        
        a = [0, -100, 1, 0]
        XCTAssertEqual(solution(&a), 1)
        
        a = [0, 1, -100, 0]
        XCTAssertEqual(solution(&a), 1)
        
        a = [0, 0, 1, 0]
        XCTAssertEqual(solution(&a), 1)
        
        a = [0, -100, -100, -100, 1, -100, -100, -100, 0]
        XCTAssertEqual(solution(&a), 1)
    }
    
    public func solution(_ A : inout [Int]) -> Int {
        let count = A.count
        
        if count == 3 {
            return 0
        }
        
        var left = [Int](repeatElement(0, count: count))
        var right = [Int](repeatElement(0, count: count))
        
        for i in 1..<count {
            left[i] = max(A[i] + left[i - 1], 0)
            right[count - i - 1] = max(A[count - i - 1] + right[count - i], 0)
        }
        
        var solution = 0
        for i in 1..<count - 1 {
            solution = max(solution, left[i - 1] + right[i + 1])
        }
        
        return solution
    }
}
