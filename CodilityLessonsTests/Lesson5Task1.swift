//
//  L5_1.swift
//  CodilityLessons
//
//  Created by Oleksandr Malovichko on 3/29/17.
//  Copyright © 2017 MAG. All rights reserved.
//

import XCTest

class L5_1: XCTestCase {
    
    func test() {
        XCTAssertEqual(solution(2, 10, 1), solutionSlow(2, 10, 1))
        XCTAssertEqual(solution(10, 11, 2), 1)
        XCTAssertEqual(solution(1, 2, 2), 1)
        XCTAssertEqual(solution(6, 11, 2), 3)
        XCTAssertEqual(solution(1, 12, 2), solutionSlow(1, 12, 2))
        XCTAssertEqual(solution(6, 12, 2), 4)
        XCTAssertEqual(solution(1, 1, 11), 0)
        XCTAssertEqual(solution(101, 123_000_000, 10_000), 12300)
        XCTAssertEqual(solution(0, 0, 11), 1)
        XCTAssertEqual(solution(11, 345, 17), solutionSlow(11, 345, 17))
        XCTAssertEqual(solutionSlow(10, 10, 20), 0)
        XCTAssertEqual(solutionSlow(10, 10, 5), 1)
        XCTAssertEqual(solutionSlow(10, 10, 7), 0)
    }
    
    public func solution(_ A : Int, _ B : Int, _ K : Int) -> Int {
        if B == 0 {
            return 1
        }
        let aDivisors = Int(A/K)
        let bDivisors = Int(B/K)

        let result = bDivisors - aDivisors
        return A % K == 0 ? result + 1 : result
    }
    
    public func solutionSlow(_ A : Int, _ B : Int, _ K : Int) -> Int {
        if B == 0 {
            return 1
        }
        var result = 0
        for index in A...B {
            if index % K == 0 {
                result += 1
            }
        }
        return result
    }
    
}
