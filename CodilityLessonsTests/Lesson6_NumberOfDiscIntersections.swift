//
//  Lesson6Task4.swift
//  CodilityLessons
//
//  Created by Oleksandr Malovichko on 4/5/17.
//
//

import XCTest

/*
 NumberOfDiscIntersections
 Compute the number of intersections in a sequence of discs.
 
 
 We draw N discs on a plane. The discs are numbered from 0 to N − 1. An array A of N non-negative integers, specifying the radiuses of the discs, is given. The J-th disc is drawn with its center at (J, 0) and radius A[J].
 
 We say that the J-th disc and K-th disc intersect if J ≠ K and the J-th and K-th discs have at least one common point (assuming that the discs contain their borders).
 
 The figure below shows discs drawn for N = 6 and A as follows:
 
 A[0] = 1
 A[1] = 5
 A[2] = 2
 A[3] = 1
 A[4] = 4
 A[5] = 0
 
 
 There are eleven (unordered) pairs of discs that intersect, namely:
 
 discs 1 and 4 intersect, and both intersect with all the other discs;
 disc 2 also intersects with discs 0 and 3.
 Write a function:
 
 public func solution(_ A : inout [Int]) -> Int
 
 that, given an array A describing N discs as explained above, returns the number of (unordered) pairs of intersecting discs. The function should return −1 if the number of intersecting pairs exceeds 10,000,000.
 
 Given array A shown above, the function should return 11, as explained above.
 
 Write an efficient algorithm for the following assumptions:
 
 N is an integer within the range [0..100,000];
 each element of array A is an integer within the range [0..2,147,483,647].
*/

class Lesson6_NumberOfDiscIntersections: XCTestCase {
    
    func test() {
        var arr = [1, 5, 2, 1, 4, 0]
        XCTAssertEqual(solution(&arr), 11)
    }
    
    public func solution(_ A : inout [Int]) -> Int {
        let count = A.count
        if count <= 1 {
            return 0
        }
        
        var arr = Array<(Int, Int)>()
        for i in 0..<count {
            let radius = A[i]
            arr.append((i - radius, i + radius))
        }
        
        arr = arr.sorted(by: { (first: (Int, Int), second: (Int, Int)) -> Bool in
            return first.0 < second.0
        })
        
        var pairs = 0
        
        for i in 0..<count - 1 {
            let circle = arr[i]
            
            let subArr = arr.suffix(from: i + 1)
            let index = binarySearch(arr: subArr, currentCircleRightPoint: circle.1)
            
            if let index = index {
                pairs += index - (i + 1)
            } else {
                pairs += subArr.count
            }
            
            if pairs > 10_000_000 {
                return -1
            }
        }
        
        return pairs
    }
    
    func binarySearch(arr: ArraySlice<(Int, Int)>, currentCircleRightPoint: Int) -> Int? {
        var lowerIndex = arr.startIndex
        var upperIndex = arr.endIndex - 1
        while true {
            let currentIndex = (lowerIndex + upperIndex) / 2
            let circle = arr[currentIndex]

            if lowerIndex == upperIndex {
                if currentCircleRightPoint < circle.0 {
                    return lowerIndex
                } else {
                    return nil
                }
            }
            
            if currentCircleRightPoint < circle.0 {
                upperIndex = currentIndex
            } else {
                lowerIndex = min(currentIndex + 1, upperIndex)
            }
        }
    }

}
