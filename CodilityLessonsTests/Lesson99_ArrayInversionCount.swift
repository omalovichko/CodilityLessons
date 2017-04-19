//
//  Lesson99_ArrayInversionCount.swift
//  CodilityLessons
//
//  Created by Oleksandr Malovichko on 4/18/17.
//
//

import XCTest

class Lesson99_ArrayInversionCount: XCTestCase {
    
    func test() {
        var arr = [Int]()
        
        arr = [10, 2, 1, 4]
        XCTAssertEqual(solution(&arr), 4)
        
        arr = [10, 2, 1, 4, 1, -1, 19]
        XCTAssertEqual(solution(&arr), 12)
        
        arr = [10, 2, 1, 4, 1, -1, 19, 1]
        XCTAssertEqual(solution(&arr), 16)
        
        arr = [1, 0, 3, 2, 4, 3]
        XCTAssertEqual(solution(&arr), 3)
        
        arr = [1, 0]
        XCTAssertEqual(solution(&arr), 1)
        
        arr = [-1, 6, 3, 4, 7, 4]
        XCTAssertEqual(solution(&arr), 4)
        
        measure {
            var arr = [Int](repeatElement(5, count: 30000))
            XCTAssertEqual(self.solution(&arr), 0)
        }
    }
    
    public func solution(_ A : inout [Int]) -> Int {
        let count = A.count
        
        if count <= 1 {
            return 0
        }
        
        var result = 0
        
        let tree = Tree(A.first!)
        
        for i in 1..<count {
            let a = A[i]
            result += tree.insertValue(value: a)
            if result > 1_000_000_000 {
                return -1
            }
        }
        
        return result
    }
    
    class Tree {
        var value: Int
        var count: Int
        
        var left : Tree?
        var leftCount = 0
        
        var right : Tree?
        var rightCount = 0
        
        func insertValue(value newValue: Int, n: Int = 0) -> Int {
            if value > newValue {
                leftCount += 1
                if let l = left {
                    return l.insertValue(value: newValue, n: n + count + rightCount)
                }
                left = Tree(newValue)
                return n + count + rightCount
            } else if value < newValue {
                rightCount += 1
                if let r = right {
                    return r.insertValue(value: newValue, n: n)
                }
                right = Tree(newValue)
                return n
            } else {
                count += 1
                return n + rightCount
            }
        }
        
        init(_ value: Int) {
            self.value = value
            count = 1
        }
    }
}
