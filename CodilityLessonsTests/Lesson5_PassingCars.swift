//
//  Lesson5_PassingCars.swift
//  CodilityLessons
//
//  Created by Oleksandr Malovichko on 3/29/17.
//  
//

import XCTest

class Lesson5_PassingCars: XCTestCase {
    
    func test() {
        var arr = [0, 1, 0, 1, 1]
        XCTAssertEqual(solution(&arr), 5)
    }
    
    public func solution(_ A : inout [Int]) -> Int {
        let count = A.count
        if count == 1 {
            return 0
        }
        var pairs = 0
        var leftCarsCount = 0
        for car in A {
            if car == 0 {
                leftCarsCount += 1
            } else {
                pairs += leftCarsCount
                if pairs > 1_000_000_000 {
                    return -1
                }
            }
        }
        return pairs
    }
}
