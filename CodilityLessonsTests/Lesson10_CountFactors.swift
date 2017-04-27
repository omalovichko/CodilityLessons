//
//  Lesson10_CountFactors.swift
//  CodilityLessons
//
//  Created by Oleksandr Malovichko on 4/27/17.
//
//

import XCTest

class Lesson10_CountFactors: XCTestCase {
    
    func test() {
        XCTAssertEqual(solution(24), 8)
    }
    
    public func solution(_ N : Int) -> Int {
        var factorsCount = 0
        for i in 1...N {
            if N % i == 0 {
                factorsCount += 1
            }
        }
        return factorsCount
    }

}
