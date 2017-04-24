//
//  Lesson2_OddOccurrencesInArray.swift
//  CodilityLessons
//
//  Created by Oleksandr Malovichko on 3/21/17.
//  
//

import XCTest

class Lesson2_OddOccurrencesInArray: XCTestCase {

    func test() {
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
    
}
