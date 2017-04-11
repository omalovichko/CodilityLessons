//
//  Lesson6Task4.swift
//  CodilityLessons
//
//  Created by Oleksandr Malovichko on 4/5/17.
//
//

import XCTest

class Lesson6Task4: XCTestCase {
    
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
