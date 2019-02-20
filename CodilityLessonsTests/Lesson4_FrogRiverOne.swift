//
//  Lesson4_FrogRiverOne.swift
//  CodilityLessons
//
//  Created by Oleksandr Malovichko on 3/29/17.
//  
//

import XCTest

/*
 FrogRiverOne
 Find the earliest time when a frog can jump to the other side of a river.
 
 
 A small frog wants to get to the other side of a river. The frog is initially located on one bank of the river (position 0) and wants to get to the opposite bank (position X+1). Leaves fall from a tree onto the surface of the river.
 
 You are given an array A consisting of N integers representing the falling leaves. A[K] represents the position where one leaf falls at time K, measured in seconds.
 
 The goal is to find the earliest time when the frog can jump to the other side of the river. The frog can cross only when leaves appear at every position across the river from 1 to X (that is, we want to find the earliest moment when all the positions from 1 to X are covered by leaves). You may assume that the speed of the current in the river is negligibly small, i.e. the leaves do not change their positions once they fall in the river.
 
 For example, you are given integer X = 5 and array A such that:
 
 A[0] = 1
 A[1] = 3
 A[2] = 1
 A[3] = 4
 A[4] = 2
 A[5] = 3
 A[6] = 5
 A[7] = 4
 In second 6, a leaf falls into position 5. This is the earliest time when leaves appear in every position across the river.
 
 Write a function:
 
 public func solution(_ X : Int, _ A : inout [Int]) -> Int
 
 that, given a non-empty array A consisting of N integers and integer X, returns the earliest time when the frog can jump to the other side of the river.
 
 If the frog is never able to jump to the other side of the river, the function should return −1.
 
 For example, given X = 5 and array A such that:
 
 A[0] = 1
 A[1] = 3
 A[2] = 1
 A[3] = 4
 A[4] = 2
 A[5] = 3
 A[6] = 5
 A[7] = 4
 the function should return 6, as explained above.
 
 Write an efficient algorithm for the following assumptions:
 
 N and X are integers within the range [1..100,000];
 each element of array A is an integer within the range [1..X].
*/

class Lesson4_FrogRiverOne: XCTestCase {
    
    func test() {
        var arr = [1, 3, 1, 4, 2, 3, 5, 4]
        XCTAssertEqual(solution(5, &arr), 6)
        
        var arr2 = [1]
        XCTAssertEqual(solution(2, &arr2), -1)
        
        var arr3 = [2]
        XCTAssertEqual(solution(2, &arr3), -1)
        
        var arr4 = [1]
        XCTAssertEqual(solution(1, &arr4), 0)
    }
    
    public func solution(_ X : Int, _ A : inout [Int]) -> Int {
        let count = A.count
        if X > count {
            return -1
        }
        
        var set = Set<Int>()
        var setCount = 0
        var index = 0
        
        for e in A {
            if !set.contains(e) && e <= X {
                set.insert(e)
                setCount += 1
            }
            
            if setCount == X {
                return index
            }
            
            index += 1
        }
        
        return -1
    }
    
}
