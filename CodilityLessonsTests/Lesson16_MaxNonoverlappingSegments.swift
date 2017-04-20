//
//  Lesson16_MaxNonoverlappingSegments.swift
//  CodilityLessons
//
//  Created by Oleksandr Malovichko on 4/20/17.
//
//

import XCTest

class Lesson16_MaxNonoverlappingSegments: XCTestCase {
    
    func test() {
//        var a = [Int]()
//        var b = [Int]()
//
//        a = [1, 3, 7, 9, 9]
//        b = [5, 6, 8, 9, 10]
//        XCTAssertEqual(solution(&a, &b), 3)
//        
//        a = [0]
//        b = [0]
//        XCTAssertEqual(solution(&a, &b), 1)
    }
    
    public func solution(_ A : inout [Int], _ B : inout [Int]) -> Int {
        let count = A.count
        
        var result = 0
        var point = 0
        
        for i in 0..<count {
            let a = A[i]
            let b = B[i]
            // TODO: 
//            if point
        }
        
        return result
    }

}
