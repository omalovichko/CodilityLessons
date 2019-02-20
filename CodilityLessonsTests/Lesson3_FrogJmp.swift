//
//  Lesson3_FrogJmp.swift
//  CodilityLessons
//
//  Created by Oleksandr Malovichko on 3/24/17.
//  
//

import XCTest

/*
 FrogJmp
 Count minimal number of jumps from position X to Y.
 
 
 A small frog wants to get to the other side of the road. The frog is currently located at position X and wants to get to a position greater than or equal to Y. The small frog always jumps a fixed distance, D.
 
 Count the minimal number of jumps that the small frog must perform to reach its target.
 
 Write a function:
 
 public func solution(_ X : Int, _ Y : Int, _ D : Int) -> Int
 
 that, given three integers X, Y and D, returns the minimal number of jumps from position X to a position equal to or greater than Y.
 
 For example, given:
 
 X = 10
 Y = 85
 D = 30
 the function should return 3, because the frog will be positioned as follows:
 
 after the first jump, at position 10 + 30 = 40
 after the second jump, at position 10 + 30 + 30 = 70
 after the third jump, at position 10 + 30 + 30 + 30 = 100
 Write an efficient algorithm for the following assumptions:
 
 X, Y and D are integers within the range [1..1,000,000,000];
 X ≤ Y.
*/

class Lesson3_FrogJmp: XCTestCase {
    
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
