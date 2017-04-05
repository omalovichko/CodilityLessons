//
//  L6_1.swift
//  CodilityLessons
//
//  Created by Oleksandr Malovichko on 4/4/17.
//  Copyright © 2017 MAG. All rights reserved.
//

import XCTest

class L6_1: XCTestCase {
    
    func test() {
        var arr = [1, 2, 3, 1]
        XCTAssertEqual(solution(&arr), 3)
    }
    
    public func solution(_ A : inout [Int]) -> Int {
        return Set(A).count
    }
    
//    public func solution(_ A : inout [Int]) -> Int {
//        if A.count == 0 {
//            return 0
//        }
//        
//        A = A.sorted()
//        
//        var result = 1
//        for k in 1..<A.count {
//            if A[k] != A[k - 1] {
//                result += 1
//            }
//        }
//        return result
//    }
    
}
