//
//  Lesson3_TapeEquilibrium.swift
//  CodilityLessons
//
//  Created by Oleksandr Malovichko on 3/28/17.
//  
//

import XCTest

/*
 TapeEquilibrium
 Minimize the value |(A[0] + ... + A[P-1]) - (A[P] + ... + A[N-1])|.
 
 
 A non-empty array A consisting of N integers is given. Array A represents numbers on a tape.
 
 Any integer P, such that 0 < P < N, splits this tape into two non-empty parts: A[0], A[1], ..., A[P − 1] and A[P], A[P + 1], ..., A[N − 1].
 
 The difference between the two parts is the value of: |(A[0] + A[1] + ... + A[P − 1]) − (A[P] + A[P + 1] + ... + A[N − 1])|
 
 In other words, it is the absolute difference between the sum of the first part and the sum of the second part.
 
 For example, consider array A such that:
 
 A[0] = 3
 A[1] = 1
 A[2] = 2
 A[3] = 4
 A[4] = 3
 We can split this tape in four places:
 
 P = 1, difference = |3 − 10| = 7
 P = 2, difference = |4 − 9| = 5
 P = 3, difference = |6 − 7| = 1
 P = 4, difference = |10 − 3| = 7
 Write a function:
 
 public func solution(_ A : inout [Int]) -> Int
 
 that, given a non-empty array A of N integers, returns the minimal difference that can be achieved.
 
 For example, given:
 
 A[0] = 3
 A[1] = 1
 A[2] = 2
 A[3] = 4
 A[4] = 3
 the function should return 1, as explained above.
 
 Write an efficient algorithm for the following assumptions:
 
 N is an integer within the range [2..100,000];
 each element of array A is an integer within the range [−1,000..1,000].
*/

class Lesson3_TapeEquilibrium: XCTestCase {
    
    func test() {
        var arr = [3, 1, 2, 4, 3]
        XCTAssertEqual(solution(&arr), 1)
        
        var arr2 = [1, 1]
        XCTAssertEqual(solution(&arr2), 0)
    }
    
    public func solution(_ A : inout [Int]) -> Int {
        var minDif = Int.max
        var leftSum = A.first!
        var rightSum = A.reduce(0, +) - leftSum
        var index = 0
        for item in A {
            if index == 0 {
                index = 1
                continue
            }
            
            let dif = leftSum - rightSum
            minDif = min(abs(minDif), abs(dif))
            
            leftSum += item
            rightSum -= item
            index += 1
        }
        return minDif
    }
    
}
