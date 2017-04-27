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
    }
    
    public func solution(_ N : Int) -> Int {
        var minimalPerimeter = Int.max
        for i in 1...N {
            for j in 1...N {
                guard i * j == N else {
                    continue
                }
                minimalPerimeter = min((i + j) * 2, minimalPerimeter)
            }
        }
        return minimalPerimeter
    }

}
