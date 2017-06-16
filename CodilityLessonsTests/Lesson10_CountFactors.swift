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
        XCTAssertEqual(solution(5), 2)
        XCTAssertEqual(solution(24), 8)
        XCTAssertEqual(solution(72), 12)
        XCTAssertEqual(solution(1), 1)
        XCTAssertEqual(solution(4), 3)
    }
    
    public func solution(_ N : Int) -> Int {
        if N == 1 {
            return 1
        }
        var factorsCount = 0
        let maxValue = Int(sqrt(Double(N)))
        for i in 1...maxValue {
            if N % i == 0 {
                factorsCount += 2
            }
        }
        if maxValue * maxValue == N {
            factorsCount -= 1
        }
        return factorsCount
    }
    
}
