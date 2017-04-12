//
//  Lesson7Task2.swift
//  CodilityLessons
//
//  Created by Oleksandr Malovichko on 4/11/17.
//
//

import XCTest

class Lesson7Task2: XCTestCase {
    
    
    func test() {
        var f = [4, 3, 2, 1, 5]
        var d = [0, 1, 0, 0, 0]
        XCTAssertEqual(solution(&f, &d), 2)
    }

    
    public func solution(_ A : inout [Int], _ B : inout [Int]) -> Int {
        let count = A.count
        if count <= 1 {
            return count
        }
        var leftFishCount = 0
        var f = Stack<(Int, Int)>(capacity: count)
        
        for i in 0..<count {
            let weight = A[i]
            let direction = B[i]
            if direction == 1 {
                f.push((weight, direction))
            } else if f.count() == 0 {
                leftFishCount += 1
            } else if f.front()!.0 > weight {
                continue
            } else {
                for _ in 0..<f.count() {
                    let currentFishWeight = f.front()!.0
                    if currentFishWeight < weight {
                        f.pop()
                    } else {
                        break
                    }
                }
                if f.count() == 0 {
                    leftFishCount += 1
                }
            }
        }
        
        return f.count() + leftFishCount
    }
    
    
    struct Stack<T> {
        private var array:Array<T?>
        private var cursor = 0
        
        init(capacity: Int) {
            array = Array<T?>(repeatElement(nil, count: capacity))
        }
        
        public func count() -> Int {
            return cursor
        }
        
        public mutating func push(_ element: T) {
            array[cursor] = element
            cursor += 1
        }
        
        public mutating func pop() {
            if cursor != 0 {
                cursor -= 1
            }
        }
        
        public func front() -> T? {
            if cursor == 0 {
                return nil
            }
            return array[cursor - 1]
        }
    }
}
