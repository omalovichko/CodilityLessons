//
//  Lesson12_ChocolatesByNumbers.swift
//  CodilityLessons
//
//  Created by Oleksandr Malovichko on 4/28/17.
//
//

import XCTest

class Lesson12_ChocolatesByNumbers: XCTestCase {
    
    func test() {
        XCTAssertEqual(solution(2, 1), 2)
        XCTAssertEqual(solution(10, 4), 5)
        XCTAssertEqual(solution(1, 1), 1)
        XCTAssertEqual(solution(1000000000, 1), 1000000000)
        measure {
            XCTAssertEqual(self.solution(415633212, 234332), 103908303)
        }
    }
    
    public func solution(_ N : Int, _ M : Int) -> Int {
        let count = N
        let step = M
        if step == 1 || count == 1 {
            return count
        }
        var chocolates = 0
        var nextPosition = 0
        while true {
            chocolates += 1
            nextPosition += step
            if nextPosition >= count {
                nextPosition = nextPosition % count
                
                if nextPosition == 0 {
                    return chocolates
                }
            }
        }
    }

}
