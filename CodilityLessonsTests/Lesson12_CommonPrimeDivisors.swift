//
//  Lesson12_CommonPrimeDivisors.swift
//  CodilityLessonsTests
//
//  Created by Oleksandr Malovichko on 3/9/19.
//

import XCTest

/*
 CommonPrimeDivisors
 Check whether two numbers have the same prime divisors.
 
 
 A prime is a positive integer X that has exactly two distinct divisors: 1 and X. The first few prime integers are 2, 3, 5, 7, 11 and 13.
 
 A prime D is called a prime divisor of a positive integer P if there exists a positive integer K such that D * K = P. For example, 2 and 5 are prime divisors of 20.
 
 You are given two positive integers N and M. The goal is to check whether the sets of prime divisors of integers N and M are exactly the same.
 
 For example, given:
 
 N = 15 and M = 75, the prime divisors are the same: {3, 5};
 N = 10 and M = 30, the prime divisors aren't the same: {2, 5} is not equal to {2, 3, 5};
 N = 9 and M = 5, the prime divisors aren't the same: {3} is not equal to {5}.
 Write a function:
 
 public func solution(_ A : inout [Int], _ B : inout [Int]) -> Int
 
 that, given two non-empty arrays A and B of Z integers, returns the number of positions K for which the prime divisors of A[K] and B[K] are exactly the same.
 
 For example, given:
 
 A[0] = 15   B[0] = 75
 A[1] = 10   B[1] = 30
 A[2] = 3    B[2] = 5
 the function should return 1, because only one pair (15, 75) has the same set of prime divisors.
 
 Write an efficient algorithm for the following assumptions:
 
 Z is an integer within the range [1..6,000];
 each element of arrays A, B is an integer within the range [1..2,147,483,647].
*/

class Lesson12_CommonPrimeDivisors: XCTestCase {
    
    func test() {

        var a = [Int]()
        var b = [Int]()
        
        a = [80]
        b = [10]
        XCTAssertEqual(solution(&a, &b), 1)
        
        a = [15, 10, 9]
        b = [75, 30, 5]
        XCTAssertEqual(solution(&a, &b), 1)

        a = [6059, 551]
        b = [442307, 303601]
        XCTAssertEqual(solution(&a, &b), 2)

        a = [2, 3, 5]
        b = [2, 3, 5]
        XCTAssertEqual(solution(&a, &b), 3)

        a = [15, 10, 3]
        b = [75, 30, 5]
        XCTAssertEqual(solution(&a, &b), 1)

        a = [2, 1, 2]
        b = [1, 2, 2]
        XCTAssertEqual(solution(&a, &b), 1)
        
        a = [1]
        b = [1]
        XCTAssertEqual(solution(&a, &b), 1)
    }

    func testPerformanceExample() {
        var a = [Int]()
        var b = [Int]()

        a = [48, 66, 67, 15, 2, 38, 28, 82, 70, 61, 56, 67, 15, 45, 17, 91, 6, 82, 8, 69, 34, 41, 85, 2, 7, 92, 51, 10, 99, 95, 12, 43, 14, 32, 63, 17, 70, 6, 18, 82, 41, 42, 60, 48, 39, 4, 73, 97, 98, 67, 36, 37, 70, 68, 12, 24, 37, 52, 82, 51, 3, 83, 44, 52, 23, 43, 39, 78, 11, 55, 18, 70, 4, 28, 35, 64, 6, 46, 21, 29, 48, 96, 49, 96, 17, 93, 37, 19, 75, 92, 1, 27, 78, 35, 25, 1, 5, 62, 99, 100]
        b = [97, 2, 74, 16, 99, 2, 88, 69, 86, 100, 24, 34, 71, 29, 27, 23, 86, 88, 80, 23, 93, 52, 24, 46, 42, 8, 57, 36, 57, 94, 65, 41, 87, 100, 50, 95, 2, 15, 18, 94, 70, 72, 29, 50, 89, 10, 12, 5, 47, 85, 56, 41, 51, 18, 95, 36, 24, 32, 83, 32, 91, 34, 45, 8, 91, 80, 48, 12, 50, 38, 85, 93, 75, 29, 5, 90, 95, 16, 50, 49, 98, 5, 7, 85, 57, 47, 78, 60, 70, 26, 9, 1, 34, 65, 38, 35, 62, 71, 60, 32]

        measure {
            for _ in 0..<100 {
                XCTAssertEqual(solution(&a, &b), 3)
            }
        }
    }

    public func solution(_ A : inout [Int], _ B : inout [Int]) -> Int {
        
        func greatestCommonDivisor(_ a: Int, _ b: Int) -> Int {
            if (a % b) == 0 {
                return b
            }
            return greatestCommonDivisor(b, a % b)
        }
        
        var numberOfPositions = 0
        
        for i in 0..<A.count {
            let a = A[i]
            let b = B[i]
            
            if a == b {
                continue
            }
            
            let gcd = greatestCommonDivisor(a, b)
            
            if gcd == 1 {
                numberOfPositions += 1
                continue
            }
            
            var x = (a / gcd) * (b / gcd)
            while x != 1 {
                let tempGCD = greatestCommonDivisor(gcd, x)
                if tempGCD == 1 {
                    numberOfPositions += 1
                    break
                }
                x = x / tempGCD
            }
        }
        
        return A.count - numberOfPositions
    }

}
