//
//  Lesson10_MinPerimeterRectangle.swift
//  CodilityLessons
//
//  Created by Oleksandr Malovichko on 4/27/17.
//
//

import XCTest

/*
 MinPerimeterRectangle
 Find the minimal perimeter of any rectangle whose area equals N.
 
 
 An integer N is given, representing the area of some rectangle.
 
 The area of a rectangle whose sides are of length A and B is A * B, and the perimeter is 2 * (A + B).
 
 The goal is to find the minimal perimeter of any rectangle whose area equals N. The sides of this rectangle should be only integers.
 
 For example, given integer N = 30, rectangles of area 30 are:
 
 (1, 30), with a perimeter of 62,
 (2, 15), with a perimeter of 34,
 (3, 10), with a perimeter of 26,
 (5, 6), with a perimeter of 22.
 Write a function:
 
 public func solution(_ N : Int) -> Int
 
 that, given an integer N, returns the minimal perimeter of any rectangle whose area is exactly equal to N.
 
 For example, given an integer N = 30, the function should return 22, as explained above.
 
 Write an efficient algorithm for the following assumptions:
 
 N is an integer within the range [1..1,000,000,000].
*/

class Lesson10_MinPerimeterRectangle: XCTestCase {
    
    func test() {
        XCTAssertEqual(solution(1), 4)
        XCTAssertEqual(solution(30), 22)
        XCTAssertEqual(solution(101), 204)
        XCTAssertEqual(solution(15486451), 30972904)
    }
    
    public func solution(_ N : Int) -> Int {
        let side = Int(sqrt(Double(N)).rounded(FloatingPointRoundingRule.up))
        
        for i in stride(from: side, to: 0, by: -1) {
            if N % i == 0 {
                return (i + N / i) * 2
            }
        }
        return -1
    }
}
