//
//  Lesson11_CountNonDivisible.swift
//  CodilityLessonsTests
//
//  Created by Oleksandr Malovichko on 15.06.2019.
//

import XCTest

/*
 CountNonDivisible
 Calculate the number of elements of an array that are not divisors of each element.
 
 
 You are given an array A consisting of N integers.
 
 For each number A[i] such that 0 ≤ i < N, we want to count the number of elements of the array that are not the divisors of A[i]. We say that these elements are non-divisors.
 
 For example, consider integer N = 5 and array A such that:
 
 A[0] = 3
 A[1] = 1
 A[2] = 2
 A[3] = 3
 A[4] = 6
 For the following elements:
 
 A[0] = 3, the non-divisors are: 2, 6,
 A[1] = 1, the non-divisors are: 3, 2, 3, 6,
 A[2] = 2, the non-divisors are: 3, 3, 6,
 A[3] = 3, the non-divisors are: 2, 6,
 A[4] = 6, there aren't any non-divisors.
 Write a function:
 
 public func solution(_ A : inout [Int]) -> [Int]
 that, given an array A consisting of N integers, returns a sequence of integers representing the amount of non-divisors.
 
 Result array should be returned as an array of integers.
 
 For example, given:
 
 A[0] = 3
 A[1] = 1
 A[2] = 2
 A[3] = 3
 A[4] = 6
 the function should return [2, 4, 3, 2, 0], as explained above.
 
 Write an efficient algorithm for the following assumptions:
 
 N is an integer within the range [1..50,000];
 each element of array A is an integer within the range [1..2 * N].
*/

class Lesson11_CountNonDivisible: XCTestCase {
    
    func test() {
        var a = [Int]()
        
        a = [3, 1, 2, 3, 6]
        XCTAssertEqual(solution(&a), [2, 4, 3, 2, 0])
    }
    
    func testPerformance() {
        var array = [Int]()
        let range = 1...(2 * 50_000)
        for _ in 1...3000 {
            array.append(Int.random(in: range))
        }
        measure {
            _ = solution(&array)
        }
    }
    
    func testAllTheSameValuesPerformance() {
        var array = [Int](repeating: 20_000, count: 50_000)
        measure {
            _ = solution(&array)
        }
    }
    
    public func solution(_ A : inout [Int]) -> [Int] {
        let maxNumber = 2 * 50_000
        let totalCount = A.count
        
        // key: number, value: count
        var allNumbersDict = [Int: Int]()
        
        for i in 0..<totalCount {
            let number = A[i]
            if let count = allNumbersDict[number] {
                allNumbersDict[number] = count + 1
            } else {
               allNumbersDict[number] = 1
            }
        }
        
        // key: number, value: non-divisors count
        var resultsDict = [Int: Int]()
        
        for entry in allNumbersDict {
            let number = entry.key
            
            var k = number * 2
            while k <= maxNumber {
                if allNumbersDict[k] != nil {
                    let duplicates = allNumbersDict[number]!
                    if let count = resultsDict[k] {
                        resultsDict[k] = count + duplicates
                    } else {
                        resultsDict[k] = duplicates
                    }
                }
                k += number
            }
        }
        
        var results = [Int]()
        for i in 0..<totalCount {
            let number = A[i]
            let duplicates = allNumbersDict[number]!
            if let count = resultsDict[number] {
                results.append(totalCount - count - duplicates)
            } else {
                results.append(totalCount - duplicates)
            }
        }
        
        return results
    }
    
}
