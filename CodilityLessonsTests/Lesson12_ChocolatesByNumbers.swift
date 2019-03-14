//
//  Lesson12_ChocolatesByNumbers.swift
//  CodilityLessons
//
//  Created by Oleksandr Malovichko on 4/28/17.
//
//

import XCTest

/*
 ChocolatesByNumbers
 There are N chocolates in a circle. Count the number of chocolates you will eat.
 
 
 Two positive integers N and M are given. Integer N represents the number of chocolates arranged in a circle, numbered from 0 to N − 1.
 
 You start to eat the chocolates. After eating a chocolate you leave only a wrapper.
 
 You begin with eating chocolate number 0. Then you omit the next M − 1 chocolates or wrappers on the circle, and eat the following one.
 
 More precisely, if you ate chocolate number X, then you will next eat the chocolate with number (X + M) modulo N (remainder of division).
 
 You stop eating when you encounter an empty wrapper.
 
 For example, given integers N = 10 and M = 4. You will eat the following chocolates: 0, 4, 8, 2, 6.
 
 The goal is to count the number of chocolates that you will eat, following the above rules.
 
 Write a function:
 
 public func solution(_ N : Int, _ M : Int) -> Int
 
 that, given two positive integers N and M, returns the number of chocolates that you will eat.
 
 For example, given integers N = 10 and M = 4. the function should return 5, as explained above.
 
 Write an efficient algorithm for the following assumptions:
 
 N and M are integers within the range [1..1,000,000,000].
*/

class Lesson12_ChocolatesByNumbers: XCTestCase {
    
    func test() {
        XCTAssertEqual(solution(2, 1), 2)
        XCTAssertEqual(solution(10, 4), 5)
        XCTAssertEqual(solution(1, 1), 1)
        XCTAssertEqual(solution(1000000000, 1), 1000000000)
    }
    
    func testPerformance() {
        measure {
            XCTAssertEqual(solution(415633212, 234332), 103908303)
        }
    }
    
    public func solution(_ N : Int, _ M : Int) -> Int {
//        Euclidean algorithm by division
        func greatestCommonDivisor(_ a: Int, _ b: Int) -> Int {
            if (a % b) == 0 {
                return b
            }
            return greatestCommonDivisor(b, a % b)
        }
        
        let divisor = greatestCommonDivisor(N, M)
        return N / divisor
    }

}
