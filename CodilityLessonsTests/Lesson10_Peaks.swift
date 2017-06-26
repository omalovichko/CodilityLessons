//
//  Lesson10_Peaks.swift
//  CodilityLessons
//
//  Created by Oleksandr Malovichko on 6/19/17.
//
//

import XCTest

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
