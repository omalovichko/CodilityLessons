//
//  L2_1.swift
//  CodilityLessons
//
//  Created by Oleksandr Malovichko on 3/21/17.
//  Copyright © 2017 MAG. All rights reserved.
//

import XCTest

class L2_1: XCTestCase {

    func testExample() {
        var arr = [9, 3, 9, 3, 9, 7, 9]
        XCTAssertEqual(solution(&arr), 7)
        
        var arr2 = [2, 2, 3, 3, 4]
        XCTAssertEqual(solution(&arr2), 4)
    }
    
    public func solution(_ A : inout [Int]) -> Int {
        let count = A.count
        guard count > 0 else {
            return 0
        }
        if count == 1 {
            return A[0]
        }
        
        var dict = Set<Int>()
        
        for number in A {
            if dict.contains(number) {
                dict.remove(number)
            } else {
                dict.insert(number)
            }
        }
        
        return dict.first!
    }
    
//    public func solution(_ A : inout [Int]) -> Int {
//        let count = A.count
//        guard count > 0 else {
//            return 0
//        }
//        if count == 1 {
//            return A[0]
//        }
//        //
//        var index = 0
//        for e in A {
//            let pairIndex = index + 2
//            if pairIndex < count && A[pairIndex] != e {
//                let nextPairIndex = pairIndex + 2
//                if nextPairIndex < count && A[nextPairIndex] == A[pairIndex] {
//                    return e
//                } else {
//                    return A[pairIndex]
//                }
//            }
//            index += 1
//        }
////        return count % 2 ? A.last! : 0
//        return 0
//    }
    
}
