//
//  Lesson15_AbsDistinct.swift
//  CodilityLessons
//
//  Created by Oleksandr Malovichko on 4/25/17.
//
//

import XCTest

class Lesson15_AbsDistinct: XCTestCase {
    
    func test() {
        var a = [Int]()

        a = [-5, -3, -1, 0, 3, 6]
        XCTAssertEqual(solution(&a), 5)
    }
    
    public func solution(_ A : inout [Int]) -> Int {
        var distincts = Set<Int>()
        A.forEach { (a) in
            distincts.insert(abs(a))
        }
        return distincts.count
    }

}
