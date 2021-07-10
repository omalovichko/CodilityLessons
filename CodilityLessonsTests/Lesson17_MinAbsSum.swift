//
//  Lesson17_MinAbsSum.swift
//  CodilityLessonsTests
//
//  Created by Oleksandr Malovichko on 7/5/18.
//

import XCTest

/*
 MinAbsSum
 Given array of integers, find the lowest absolute sum of elements.
 
 
 For a given array A of N integers and a sequence S of N integers from the set {−1, 1}, we define val(A, S) as follows:
 
 val(A, S) = |sum{ A[i]*S[i] for i = 0..N−1 }|
 (Assume that the sum of zero elements equals zero.)
 
 For a given array A, we are looking for such a sequence S that minimizes val(A,S).
 
 Write a function:
 
 public func solution(_ A : inout [Int]) -> Int
 that, given an array A of N integers, computes the minimum value of val(A,S) from all possible values of val(A,S) for all possible sequences S of N integers from the set {−1, 1}.
 
 For example, given array:
 
 A[0] =  1
 A[1] =  5
 A[2] =  2
 A[3] = -2
 your function should return 0, since for S = [−1, 1, −1, 1], val(A, S) = 0, which is the minimum possible value.
 
 Write an efficient algorithm for the following assumptions:
 
 N is an integer within the range [0..20,000];
 each element of array A is an integer within the range [−100..100].
*/

class Lesson17_MinAbsSum: XCTestCase {
    
    func test() {
        var a = [Int]()
        
        a = [5, 4, 3, 3, 3]
        XCTAssertEqual(solution(&a), 0)
        
        a = [86, 12, 67, 25, 48, 31, 30, 96, 26, 37, 21, 47]
        XCTAssertEqual(solution(&a), 0)
        
        a = [1, 5, 2, -2]
        XCTAssertEqual(solution(&a), 0)
        
        a = [3, 3, 3, 4, 5]
        XCTAssertEqual(solution(&a), 0)
        
        a = [2, 2, 1]
        XCTAssertEqual(solution(&a), 1)
        
        a = [1, 5, -2, 5, 2, 3]
        XCTAssertEqual(solution(&a), 0)
        
        a = [18, 99, -50, 100, 4, 18, 99, -50, 100, 4, 18, 99, -50, 100, 4, 18, 99, -50, 100, 4]
        XCTAssertEqual(solution(&a), 0)
        
        a = [91, 92, 93, 94, 95, 96, 97]
        XCTAssertEqual(solution(&a), 82)
    }
    
    func testPerfomance() {
        var a = Array(repeatElement(-100, count: 20_000))
        measure {
            XCTAssertEqual(self.solution(&a), 0)
        }
    }
    
    func testPerfomance2() {
        var a = [Int]()
        for _ in 0..<2_000 {
            a.append(Int.random(in: -100...100))
        }
        measure {
            _ = self.solution(&a)
        }
    }
    
    func testPerfomance3() {
        var a = Array(repeatElement(5, count: 5_000))
        a.append(contentsOf: Array(repeatElement(42, count: 5_000)))
        a.shuffle()
        measure {
            _ = self.solution(&a)
        }
    }
    
    func testPerfomance4() {
        var a = Array(repeatElement(4, count: 9_999))
        a.append(1)
        measure {
            XCTAssertEqual(self.solution(&a), 3)
        }
    }
    
    public func solution(_ A : inout [Int]) -> Int {
        
        if A.count == 0 {
            return 0
        }
        
        if A.count == 1 {
            return A[0]
        }
        
        var leftSum = 0
        var rightSum = 0
        
        var left = [Int]()
        var right = [Int]()
        
        A.forEach { (a) in
            let weight = abs(a)
            if leftSum < rightSum {
                leftSum += weight
                left.append(weight)
            } else {
                rightSum += weight
                right.append(weight)
            }
        }
        
        var absDifference = abs(leftSum - rightSum)
        if absDifference <= 1 {
            return absDifference
        }
        
        let leftWeights = weightsToMove(weights: left)
        let rightWeights = weightsToMove(weights: right)
        
        let difference = leftSum - rightSum
        for i in 0..<leftWeights.count {
            for j in 0..<rightWeights.count {
                let tempDifference = abs(difference - leftWeights[i] * 2 + rightWeights[j] * 2)
                absDifference = min(absDifference, tempDifference)
            }
        }
        
        return absDifference
    }
    
    func weightsToMove(weights: [Int]) -> [Int] {
        let maxWeight = 100 * 2
        
        var results = Set<Int>()
        
        results.insert(0)
        
        for i in 0..<weights.count {
            let weight = weights[i]
            var nextResults = results
            results.forEach({ (sum) in
                let nextSum = sum + weight
                if nextSum <= maxWeight {
                    nextResults.insert(nextSum)
                }
            })
            results = nextResults
        }
        return Array(results)
    }
    
}

