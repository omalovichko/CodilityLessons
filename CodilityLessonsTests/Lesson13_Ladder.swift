//
//  Lesson13_Ladder.swift
//  CodilityLessonsTests
//
//  Created by Oleksandr Malovichko on 15.06.2019.
//

import XCTest

/*
 Ladder
 Count the number of different ways of climbing to the top of a ladder.
 
 
 You have to climb up a ladder. The ladder has exactly N rungs, numbered from 1 to N. With each step, you can ascend by one or two rungs. More precisely:
 
 with your first step you can stand on rung 1 or 2,
 if you are on rung K, you can move to rungs K + 1 or K + 2,
 finally you have to stand on rung N.
 Your task is to count the number of different ways of climbing to the top of the ladder.
 
 For example, given N = 4, you have five different ways of climbing, ascending by:
 
 1, 1, 1 and 1 rung,
 1, 1 and 2 rungs,
 1, 2 and 1 rung,
 2, 1 and 1 rungs, and
 2 and 2 rungs.
 Given N = 5, you have eight different ways of climbing, ascending by:
 
 1, 1, 1, 1 and 1 rung,
 1, 1, 1 and 2 rungs,
 1, 1, 2 and 1 rung,
 1, 2, 1 and 1 rung,
 1, 2 and 2 rungs,
 2, 1, 1 and 1 rungs,
 2, 1 and 2 rungs, and
 2, 2 and 1 rung.
 The number of different ways can be very large, so it is sufficient to return the result modulo 2P, for a given integer P.
 
 Write a function:
 
 public func solution(_ A : inout [Int], _ B : inout [Int]) -> [Int]
 that, given two non-empty arrays A and B of L integers, returns an array consisting of L integers specifying the consecutive answers; position I should contain the number of different ways of climbing the ladder with A[I] rungs modulo 2B[I].
 
 For example, given L = 5 and:
 
 A[0] = 4   B[0] = 3
 A[1] = 4   B[1] = 2
 A[2] = 5   B[2] = 4
 A[3] = 5   B[3] = 3
 A[4] = 1   B[4] = 1
 the function should return the sequence [5, 1, 8, 0, 1], as explained above.
 
 Write an efficient algorithm for the following assumptions:
 
 L is an integer within the range [1..50,000];
 each element of array A is an integer within the range [1..L];
 each element of array B is an integer within the range [1..30].
*/

class Lesson13_Ladder: XCTestCase {
    
    func test() {
        var a = [Int]()
        var b = [Int]()
        
        a = [4, 4, 5, 5, 1]
        b = [3, 2, 4, 3, 1]
        XCTAssertEqual(solution(&a, &b), [5, 1, 8, 0, 1])
        
        a = [97, 2, 74, 16, 99, 2, 88, 69, 86, 100, 24, 34, 71, 29, 27, 23, 86, 88, 80, 23, 93, 52, 24, 46, 42, 8, 57, 36, 57, 94, 65, 41, 87, 100, 50, 95, 2, 15, 18, 94, 70, 72, 29, 50, 89, 10, 12, 5, 47, 85, 56, 41, 51, 18, 95, 36, 24, 32, 83, 32, 91, 34, 45, 8, 91, 80, 48, 12, 50, 38, 85, 93, 75, 29, 5, 90, 95, 16, 50, 49, 98, 5, 7, 85, 57, 47, 78, 60, 70, 26, 9, 1, 34, 65, 38, 35, 62, 71, 60, 32]
        b = [11, 15, 13, 14, 13, 20, 8, 20, 1, 10, 11, 5, 23, 10, 24, 29, 8, 27, 25, 21, 1, 14, 19, 9, 7, 10, 8, 24, 11, 13, 20, 29, 9, 2, 30, 25, 24, 16, 8, 5, 10, 14, 2, 21, 22, 1, 26, 15, 28, 15, 24, 14, 19, 15, 1, 5, 7, 13, 12, 17, 20, 13, 10, 16, 29, 24, 20, 25, 7, 4, 3, 4, 1, 19, 28, 4, 21, 29, 23, 5, 20, 8, 6, 1, 16, 28, 4, 5, 12, 2, 14, 22, 14, 2, 1, 6, 21, 28, 16, 4]
        let result = solution(&a, &b)
        XCTAssertEqual(result[0], 1729)
        XCTAssertEqual(result[1], 2)
        XCTAssertEqual(result[2], 7106)
        XCTAssertEqual(result[3], 1597)
    }
    
    func testPerformance() {
        var a = Array(repeating: 50_000, count: 50_000)
        var b = Array(repeating: 30, count: 50_000)
        measure {
            _ = solution(&a, &b)
        }
    }
    
    public func solution(_ A : inout [Int], _ B : inout [Int]) -> [Int] {
        var numbersToFind = Set(A)
        // key: number of rungs value: Fibonacci number
        var resultsDictionary = [Int: Int]()
        
        let maxModB = Int(pow(2, Double(30)))
        var a = 0
        var b = 1
        var fib = 1
        var numberOfRungs = 0
        repeat {
            fib = (a + b) % maxModB
            a = b
            b = fib
            numberOfRungs += 1
            
            if numbersToFind.contains(numberOfRungs) {
                resultsDictionary[numberOfRungs] = fib
                numbersToFind.remove(numberOfRungs)
            }
            
        } while numbersToFind.count > 0        
        
        var results = [Int]()
        for i in 0..<A.count {
            let b = Int(pow(2, Double(B[i])))
            let result = resultsDictionary[A[i]]! % b
            results.append(result)
        }
        
        return results
    }
}
