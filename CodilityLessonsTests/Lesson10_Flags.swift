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
    
    func testPerformance() {
        var array = [Int](repeating: 0, count: 1000)
        for peakIndex in [12, 17, 24, 41, 48, 75, 93, 99, 109, 131, 133, 143, 160, 166, 169, 176, 194, 201, 203, 205, 209, 216, 228, 232, 238, 242, 268, 280, 291, 294, 314, 319, 324, 329, 331, 340, 343, 347, 353, 364, 370, 396, 406, 415, 438, 458, 461, 467, 478, 485, 488, 503, 530, 534, 548, 561, 590, 611, 619, 632, 651, 658, 665, 669, 698, 713, 717, 726, 754, 764, 771, 773, 776, 779, 783, 792, 810, 832, 836, 853, 859, 866, 868, 870, 879, 881, 887, 891, 894, 910, 917, 923, 931, 938, 944, 948, 973, 977, 982, 984] {
            array[peakIndex] = 1
        }
        measure {
            XCTAssertEqual(solution(&array), 28)
        }
    }
    
    public func solution(_ A : inout [Int]) -> Int {
        
        // Find peaks
        var peakPositions = [Int]()
        
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
                peakPositions.append(i - 1)
                possiblePeak = false
            } else {
                possiblePeak = false
            }
            left = value
        }
        
        // Calculate maximum number of flags
        if peakPositions.count <= 2 {
            return peakPositions.count
        }
        
        // key: Distance limit between flags
        typealias FlagsType = [Int: (flagsCount: Int, currentPosition: Int)]
        
        var flags = FlagsType()
        var newEntries = FlagsType()
        
        let firstPeakPosition = peakPositions[0]
        
        flags[Int.max] = (1, firstPeakPosition)
        
        var maxNumberOfFlags = 0
        
        let addFlag: (_ distance: Int, _ flagsCount: Int, _ currentPosition: Int) -> Void = { distance, flagsCount, currentPosition in
            
            let existedCount = newEntries[distance]?.flagsCount ?? 0
            let z = newEntries[distance]?.currentPosition ?? -1

            
            if flagsCount > existedCount {
                newEntries[distance] = (flagsCount, currentPosition)
            } else if flagsCount == existedCount && currentPosition < z {
                newEntries[distance] = (flagsCount, currentPosition)
            }
        }
        
        for i in 1..<peakPositions.count {
            let currentPeakPosition = peakPositions[i]
            
            for entry in flags {
                
                let distanceBetweenPeaks = currentPeakPosition - entry.value.currentPosition
                if distanceBetweenPeaks >= entry.key {
                    
                    let newCount = entry.value.flagsCount + 1
                    addFlag(entry.key, newCount, currentPeakPosition)
                } else {
                    
                    let newCount = entry.value.flagsCount + 1
                    addFlag(distanceBetweenPeaks, newCount, currentPeakPosition)
                }
                
                addFlag(entry.key, entry.value.flagsCount, entry.value.currentPosition)
            }
            
            flags = newEntries
            newEntries = FlagsType()
        }
        
        for entry in flags {
            maxNumberOfFlags = max(maxNumberOfFlags, min(entry.key, entry.value.flagsCount))
        }

        
        return maxNumberOfFlags
    }
    
}
