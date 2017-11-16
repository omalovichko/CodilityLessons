//
//  Lesson99_SqlSum.swift
//  CodilityLessons
//
//  Created by Oleksandr Malovichko on 4/18/17.
//
//

import XCTest

class Lesson99_SqlSum: XCTestCase {
    
    func test() {
        XCTAssertEqual(solution(), "SELECT SUM(v) FROM elements")
    }
    
    func solution() -> String {
        return "SELECT SUM(v) FROM elements"
    }

}
