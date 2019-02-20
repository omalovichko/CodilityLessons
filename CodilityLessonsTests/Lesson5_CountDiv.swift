//
//  Lesson5_CountDiv.swift
//  CodilityLessons
//
//  Created by Oleksandr Malovichko on 3/29/17.
//  
//

import XCTest

/*
 CountDiv
 Compute number of integers divisible by k in range [a..b].
 
 
 Write a function:
 
 public func solution(_ A : Int, _ B : Int, _ K : Int) -> Int
 that, given three integers A, B and K, returns the number of integers within the range [A..B] that are divisible by K, i.e.:
 
 { i : A ≤ i ≤ B, i mod K = 0 }
 For example, for A = 6, B = 11 and K = 2, your function should return 3, because there are three numbers divisible by 2 within the range [6..11], namely 6, 8 and 10.
 
 Write an efficient algorithm for the following assumptions:
 
 A and B are integers within the range [0..2,000,000,000];
 K is an integer within the range [1..2,000,000,000];
 A ≤ B.
*/

class Lesson5_CountDiv: XCTestCase {
    
    func test() {
        XCTAssertEqual(solution(10, 11, 2), 1)
        XCTAssertEqual(solution(1, 2, 2), 1)
        XCTAssertEqual(solution(6, 11, 2), 3)
        XCTAssertEqual(solution(6, 12, 2), 4)
        XCTAssertEqual(solution(1, 1, 11), 0)
        XCTAssertEqual(solution(101, 123_000_000, 10_000), 12300)
        XCTAssertEqual(solution(0, 0, 11), 1)
    }
    
    public func solution(_ A : Int, _ B : Int, _ K : Int) -> Int {
        if B == 0 {
            return 1
        }
        let aDivisors = Int(A/K)
        let bDivisors = Int(B/K)

        let result = bDivisors - aDivisors
        return A % K == 0 ? result + 1 : result
    }
    
}
