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
        let c = CharacterSet()
        XCTAssertEqual(solution(10, 4), 5)
        XCTAssertEqual(solution(1, 1), 1)
        XCTAssertEqual(solution(2, 1), 1)
    }
    
    public func solution(_ N : Int, _ M : Int) -> Int {
        print("N = " + N.description)
        print("M = " + M.description)
        
        if N == M {
            return 1
        }
        
        var chocolates = 0
        var value = N
        while true {
            let c = value / M
            let o = value % M
            chocolates += c
            value = N - o
            if o == 0 {
                break
            }
        }
        
        let x = Array<Int>()
        
        return chocolates
    }

}
