//
//  Lesson99_PolygonConcavityIndex.swift
//  CodilityLessons
//
//  Created by Oleksandr Malovichko on 4/19/17.
//
//

import XCTest

class Lesson99_PolygonConcavityIndex: XCTestCase {
    
    func test() {
        var points = [Point2D]()
        
        points = [Point2D(-1, 3), Point2D(3, 1), Point2D(0, -1), Point2D(-2, 1)]
        
        XCTAssertEqual(solution(&points), -1)
    }
    
    public func solution(_ A : inout [Point2D]) -> Int {
        return -1
    }
    
    struct Point2D {
        var x: Int = 0
        var y: Int = 0
        init(_ x: Int, _ y: Int) {
            self.x = x
            self.y = y
        }
    }
}
