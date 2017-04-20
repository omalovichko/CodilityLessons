//
//  Lesson92_TennisTournament.swift
//  CodilityLessons
//
//  Created by Oleksandr Malovichko on 4/20/17.
//
//

import XCTest

class Lesson92_TennisTournament: XCTestCase {
    
    func test() {
        XCTAssertEqual(solution(5, 3), 2)
        XCTAssertEqual(solution(10, 3), 3)
    }
    
    public func solution(_ P : Int, _ C : Int) -> Int {
        return P > C * 2 ? C : P / 2
    }
}
