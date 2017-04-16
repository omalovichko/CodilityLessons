//
//  L3_1.swift
//  CodilityLessons
//
//  Created by Oleksandr Malovichko on 3/24/17.
//  
//

import XCTest
import Foundation

class Lesson3Task1: XCTestCase {
    
    func test() {
        XCTAssertEqual(solution(1, 5, 2), 2)
        XCTAssertEqual(solution(10, 85, 30), 3)
        XCTAssertEqual(solution(0, 1_000_000_000, 1_000_000_000), 1)
    }
    
    public func solution(_ X : Int, _ Y : Int, _ D : Int) -> Int {
        let jumps = Double(Y - X) / Double(D)
        let jRound = ceil(jumps)
        return Int(jRound)
    }
    
}
