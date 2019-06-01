//
//  Lesson10_Flags.swift
//  CodilityLessonsTests
//
//  Created by Oleksandr Malovichko on 3/14/19.
//

import XCTest

/*
 Flags
 Find the maximum number of flags that can be set on mountain peaks.
 
 
 A non-empty array A consisting of N integers is given.
 
 A peak is an array element which is larger than its neighbours. More precisely, it is an index P such that 0 < P < N − 1 and A[P − 1] < A[P] > A[P + 1].
 
 For example, the following array A:
 
 A[0] = 1
 A[1] = 5
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
 has exactly four peaks: elements 1, 3, 5 and 10.
 
 You are going on a trip to a range of mountains whose relative heights are represented by array A, as shown in a figure below. You have to choose how many flags you should take with you. The goal is to set the maximum number of flags on the peaks, according to certain rules.
 
 
 
 Flags can only be set on peaks. What's more, if you take K flags, then the distance between any two flags should be greater than or equal to K. The distance between indices P and Q is the absolute value |P − Q|.
 
 For example, given the mountain range represented by array A, above, with N = 12, if you take:
 
 two flags, you can set them on peaks 1 and 5;
 three flags, you can set them on peaks 1, 5 and 10;
 four flags, you can set only three flags, on peaks 1, 5 and 10.
 You can therefore set a maximum of three flags in this case.
 
 Write a function:
 
 public func solution(_ A : inout [Int]) -> Int
 that, given a non-empty array A of N integers, returns the maximum number of flags that can be set on the peaks of the array.
 
 For example, the following array A:
 
 A[0] = 1
 A[1] = 5
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
 
 N is an integer within the range [1..400,000];
 each element of array A is an integer within the range [0..1,000,000,000].
*/

class Lesson10_Flags: XCTestCase {

    func test() {
        var array = [Int]()
        
        array = [0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0]
        XCTAssertEqual(solution(&array), 4)
        
        array = [0, 0, 0, 0, 0, 1, 0, 1, 0, 1]
        XCTAssertEqual(solution(&array), 2)
        
        array = [1, 5, 3, 4, 3, 4, 1, 2, 3, 4, 6, 2]
        XCTAssertEqual(solution(&array), 3)
    }
    
    
    //Time: 3.478 sec
    func testPerformance() {
        var a = [Int]()
        for _ in 0..<10_000 {
            a.append(Int(arc4random_uniform(1_000_000_000)))
        }
        measure {
            _ = self.solution(&a)
        }
    }
    
    public func solution(_ A : inout [Int]) -> Int {
        var peakIndexes = [Int]()
        
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
            } else if leftUnwrapped > value && possiblePeak {
                peakIndexes.append(i - 1)
                possiblePeak = false
            } else {
                possiblePeak = false
            }
            left = value
        }
        
        guard peakIndexes.count != 0 else {
            return 0
        }
        
        guard peakIndexes.count != 1 else {
            return 1
        }
        
        // key: distance limit between flags
        // value: number of flags
        var flags = [Int: Int]()
        var previousIndex = peakIndexes[0]
        
        var result = -1
        
        for i in 1..<peakIndexes.count {
            let index = peakIndexes[i]
            let distance = index - previousIndex
            
            var newFlags = [Int: Int]()
            
            if flags.isEmpty {
                newFlags[distance] = 1
                if distance >= 2 {
                    result = 1
                }
            }
            
            for entry in flags {
                if distance >= entry.key {
                    let existedCount = newFlags[entry.key] ?? 0
                    newFlags[entry.key] = entry.value + 1 + existedCount
                } else {
                    let existedCount = newFlags[distance] ?? 0
                    newFlags[distance] = entry.value + 1 + existedCount
                }
                
                let sumDistance = distance + entry.key
                let existedCount = newFlags[sumDistance] ?? 0
                newFlags[sumDistance] = 1 + existedCount
                
                newFlags[entry.key] = max(entry.value, (newFlags[entry.key] ?? 0))
            }
            
            for entry in newFlags {
                if entry.key >= entry.value {
                    result = max(result, entry.value)
                }
            }
            
            flags = newFlags
            previousIndex = index
        }
        
        return result + 1
    }
    
}
