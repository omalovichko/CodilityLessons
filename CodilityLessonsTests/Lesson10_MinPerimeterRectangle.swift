//
//  Lesson10_MinPerimeterRectangle.swift
//  CodilityLessons
//
//  Created by Oleksandr Malovichko on 4/27/17.
//
//

import XCTest

class Lesson10_MinPerimeterRectangle: XCTestCase {
    
    func test() {
        XCTAssertEqual(solution(1), 4)
        XCTAssertEqual(solution(30), 22)
        XCTAssertEqual(solution(101), 204)
        XCTAssertEqual(solution(15486451), 30972904)
    }
    
    public func solution(_ N : Int) -> Int {
        let side = Int(sqrt(Double(N)).rounded(FloatingPointRoundingRule.up))
        
        for i in stride(from: side, to: 0, by: -1) {
            if N % i == 0 {
                return (i + N / i) * 2
            }
        }
        return -1
    }
}
