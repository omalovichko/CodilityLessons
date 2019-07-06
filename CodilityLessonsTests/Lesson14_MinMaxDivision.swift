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
        var k: Int
        var m: Int
        
        a = [2, 1, 5, 1, 2, 2, 2]
        k = 3
        m = 5
//        XCTAssertEqual(solution(k, m, &a), 6)
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
    
//    public func solution(_ K : Int, _ M : Int, _ A : inout [Int]) -> Int {
//        var prefixSums = [0]
//        for i in 0..<A.count {
////            totalSum += A[i]
//            prefixSums.append(prefixSums.last! + A[i])
//        }
//        
//        let totalSum = prefixSums.last!
//        
//        let calc: (_ startIndex: Int) -> Int = { startIndex in
//            for i in startIndex..<prefixSums.count {
//                let totalLeftSum = prefixSums[i]
//                let sum = totalLeftSum - handledLeftSum
//                
//                if targetSum == sum {
//                    handledLeftSum = totalLeftSum
//                    blocks += 1
//                }
//            }
//            return 1
//        }
//        
//        
//        var targetSum = totalSum / K
//        
//        var handledLeftSum = 0
//        var blocks = 0
//        
//        
//        
//        
////        var totalSum = prefixSums.last!
////
////        var targetSum = totalSum / K
////
////        var left = 0
////        var right = A.count - 1
////        var handledLeftSum = 0
////        var position = -1
////        var currentLeftSum = -1
////
////        repeat {
////            let mid = (left + right) / 2
////            let totalLeftSum = prefixSums[mid]
////            let leftSum = totalLeftSum - handledLeftSum
////
////            if leftSum == targetSum {
////                handledLeftSum = totalLeftSum
////                position = mid
////                break
////            } else if leftSum > targetSum {
////                right = mid - 1
////            } else {
////                left = mid + 1
////                position = mid
////                currentLeftSum = leftSum
////            }
////        } while left <= right
////        print(position)
//        
//        return targetSum
//    }
}
