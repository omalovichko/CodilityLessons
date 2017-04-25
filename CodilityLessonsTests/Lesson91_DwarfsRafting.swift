//
//  Lesson91_DwarfsRafting.swift
//  CodilityLessons
//
//  Created by Oleksandr Malovichko on 4/25/17.
//
//

import XCTest

class Lesson91_DwarfsRafting: XCTestCase {
    
    func test() {
        var s = String()
        var t = String()
        
        s = "1B 1C 4B 1D 2A"
        t = "3B 2D"
        XCTAssertEqual(solution(4, &s, &t), 6)
    }
    
    public func solution(_ N : Int, _ S : inout String, _ T : inout String) -> Int {
        return 0
    }

}
