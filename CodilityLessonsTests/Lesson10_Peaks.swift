//
//  Lesson10_Peaks.swift
//  CodilityLessons
//
//  Created by Oleksandr Malovichko on 6/19/17.
//
//

import XCTest

/*
 Peaks
 Divide an array into the maximum number of same-sized blocks, each of which should contain an index P such that A[P - 1] < A[P] > A[P + 1].
 
 
 A non-empty array A consisting of N integers is given.
 
 A peak is an array element which is larger than its neighbors. More precisely, it is an index P such that 0 < P < N − 1,  A[P − 1] < A[P] and A[P] > A[P + 1].
 
 For example, the following array A:
 
 A[0] = 1
 A[1] = 2
 A[2] = 3
 A[3] = 4
 A[4] = 3
 A[5] = 4
 A[6] = 1
 A[7] = 2
 A[8] = 3
 A[9] = 4
 A[10] = 6
 A[11] = 2
 has exactly three peaks: 3, 5, 10.
 
 We want to divide this array into blocks containing the same number of elements. More precisely, we want to choose a number K that will yield the following blocks:
 
 A[0], A[1], ..., A[K − 1],
 A[K], A[K + 1], ..., A[2K − 1],
 ...
 A[N − K], A[N − K + 1], ..., A[N − 1].
 What's more, every block should contain at least one peak. Notice that extreme elements of the blocks (for example A[K − 1] or A[K]) can also be peaks, but only if they have both neighbors (including one in an adjacent blocks).
 
 The goal is to find the maximum number of blocks into which the array A can be divided.
 
 Array A can be divided into blocks as follows:
 
 one block (1, 2, 3, 4, 3, 4, 1, 2, 3, 4, 6, 2). This block contains three peaks.
 two blocks (1, 2, 3, 4, 3, 4) and (1, 2, 3, 4, 6, 2). Every block has a peak.
 three blocks (1, 2, 3, 4), (3, 4, 1, 2), (3, 4, 6, 2). Every block has a peak. Notice in particular that the first block (1, 2, 3, 4) has a peak at A[3], because A[2] < A[3] > A[4], even though A[4] is in the adjacent block.
 However, array A cannot be divided into four blocks, (1, 2, 3), (4, 3, 4), (1, 2, 3) and (4, 6, 2), because the (1, 2, 3) blocks do not contain a peak. Notice in particular that the (4, 3, 4) block contains two peaks: A[3] and A[5].
 
 The maximum number of blocks that array A can be divided into is three.
 
 Write a function:
 
 public func solution(_ A : inout [Int]) -> Int
 
 that, given a non-empty array A consisting of N integers, returns the maximum number of blocks into which A can be divided.
 
 If A cannot be divided into some number of blocks, the function should return 0.
 
 For example, given:
 
 A[0] = 1
 A[1] = 2
 A[2] = 3
 A[3] = 4
 A[4] = 3
 A[5] = 4
 A[6] = 1
 A[7] = 2
 A[8] = 3
 A[9] = 4
 A[10] = 6
 A[11] = 2
 the function should return 3, as explained above.
 
 Write an efficient algorithm for the following assumptions:
 
 N is an integer within the range [1..100,000];
 each element of array A is an integer within the range [0..1,000,000,000].
*/

class Lesson10_Peaks: XCTestCase {
    
    func test() {
        var array = [1, 2, 3, 4, 3, 4, 1, 2, 3, 4, 6, 2]
        XCTAssertEqual(solution(&array), 3)
        
        array = [0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0]
        XCTAssertEqual(solution(&array), 1)
        
        array = [0, 0]
        XCTAssertEqual(solution(&array), 0)
        
        array = [0, 1, 1, 0]
        XCTAssertEqual(solution(&array), 0)
        
        array = [5, 6, 5, 6, 1, 1, 1, 1, 6, 5, 6, 5]
        XCTAssertEqual(solution(&array), 4)
    }
    
    func testPerformance() {
        var a = [Int]()
        for _ in 0..<100_000 {
            a.append(Int(arc4random_uniform(1_000_000_000)))
        }
        measure {
            _ = self.solution(&a)
        }
    }

    public func solution(_ A : inout [Int]) -> Int {
        var peakIndexes = Array<Int>()
        
        // Calculate peaks indexes
        var left: Int?
        var possiblePeak = false
        for i in 0..<A.count {
            let value = A[i]
            guard let leftUnwrapped = left else {
                left = value
                continue
            }
            
            if leftUnwrapped < value {
                possiblePeak = true
            } else if leftUnwrapped > value {
                if possiblePeak {
                    peakIndexes.append(i - 1)
                    possiblePeak = false
                }
            } else {
                possiblePeak = false
            }
            left = value
        }
        
        // Check if peaks fit in blocks
        for blocks in stride(from: peakIndexes.count, to: 1, by: -1) {
            if A.count % blocks != 0 {
                continue
            }
            let blockSize = A.count / blocks
            
            var peakIndex = 0
            var unusedPeaksCount = peakIndexes.count
            for blockIndex in 1...blocks {
                let blockMaxRightIndex = blockSize * blockIndex - 1
                var peaksInBlock = 0
                while peakIndexes[peakIndex] <= blockMaxRightIndex {
                    peakIndex += 1
                    unusedPeaksCount -= 1
                    peaksInBlock += 1
                    
                    if unusedPeaksCount == 0 {
                        if blockIndex == blocks {
                            return blocks
                        } else {
                            break
                        }
                    }
                }
                if peaksInBlock == 0 || unusedPeaksCount <= 0 {
                    break
                }
            }
        }
        
        return peakIndexes.count > 0 ? 1 : 0
    }
    
}
