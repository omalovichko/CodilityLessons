//
//  Lesson90_FloodDepth.swift
//  CodilityLessons
//
//  Created by Oleksandr Malovichko on 4/20/17.
//
//

import XCTest

class Lesson90_FloodDepth: XCTestCase {
    
    func test() {
        var a = [Int]()

        a = [5, 8]
        XCTAssertEqual(solution(&a), 0)

        a = [1, 3, 2, 1, 2, 1, 5, 3, 3, 4]
        XCTAssertEqual(solution(&a), 2)
        
        a = [1, 2, 3, 4, 5, 2, 1, 5]
        XCTAssertEqual(solution(&a), 4)
    }
    
    public func solution(_ A : inout [Int]) -> Int {
        let count = A.count
        
        if count <= 2 {
            return 0
        }
        
        var depth = 0
        
        var top = A.first!
        var bottom = top
        
        for i in 1..<count {
            let a = A[i]
            if bottom == a {
                continue
            } else if bottom > a {
                bottom = a
            } else {
                if a == top {
                    depth = max(depth, top - bottom)
                    bottom = top
                } else if a < top {
                    depth = max(depth, a - bottom)
                } else {
                    depth = max(depth, top - bottom)
                    top = a
                    bottom = a
                }
            }
        }
        
        return depth
    }
}
