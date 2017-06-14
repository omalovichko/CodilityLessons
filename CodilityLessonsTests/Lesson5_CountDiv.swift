//
//  L5_1.swift
//  CodilityLessons
//
//  Created by Oleksandr Malovichko on 3/29/17.
//  
//

import XCTest

class Lesson5_CountDiv: XCTestCase {
    
    func test() {
        XCTAssertEqual(solution(10, 11, 2), 1)
        XCTAssertEqual(solution(1, 2, 2), 1)
        XCTAssertEqual(solution(6, 11, 2), 3)
        XCTAssertEqual(solution(6, 12, 2), 4)
        XCTAssertEqual(solution(1, 1, 11), 0)
        XCTAssertEqual(solution(101, 123_000_000, 10_000), 12300)
        XCTAssertEqual(solution(0, 0, 11), 1)
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
    
}
