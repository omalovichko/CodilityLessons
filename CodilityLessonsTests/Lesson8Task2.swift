//
//  Lesson8Task2.swift
//  CodilityLessons
//
//  Created by Oleksandr Malovichko on 4/12/17.
//
//

import XCTest

class Lesson8Task2: XCTestCase {
    
    func test() {
        var arr = [3, 4, 3, 2, 3, -1, 3, 3]
        XCTAssert(arr[solution(&arr)] == 3)
    }
    
    public func solution(_ A : inout [Int]) -> Int {
        let count = A.count
        if count == 0 || count == 2 {
            return -1
        }
        if count == 1 {
            return 0
        }
        
        var size = 0
        var candidate = (value: 0, index: 0)
        for i in 0..<count {
            if size == 0 {
                candidate = (A[i], i)
                size += 1
            } else {
                if candidate.value != A[i] {
                    size -= 1
                } else {
                    size += 1
                }
            }
        }
        
        if size <= 0 {
            return -1
        }
        
        let elements = A.filter { (v) -> Bool in
            return v == candidate.value
        }.count
        
        return elements >= count / 2 + 1 ? candidate.index : -1
    }

}
