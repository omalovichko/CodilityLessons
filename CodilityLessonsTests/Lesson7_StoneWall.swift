//
//  Lesson7Task4.swift
//  CodilityLessons
//
//  Created by Oleksandr Malovichko on 4/12/17.
//
//

import XCTest

class Lesson7_StoneWall: XCTestCase {
 
    func test() {
        var input = [8, 8, 5, 7, 9, 8, 7, 4, 8]
        XCTAssertEqual(solution(&input), 7)
    }
    
    
    public func solution(_ H : inout [Int]) -> Int {
        let count = H.count
        if count <= 1 {
            return count
        }
        
        var blocks = 0
        var stack = Stack<Int>(capacity: count)
        
        for i in 0..<count {
            let e = H[i]
            if stack.count() == 0 {
                stack.push(e)
                continue
            }
            let last = stack.front()!
            if last == e {
                continue
            } else if last < e {
                stack.push(e)
            } else {
                for _ in 0..<stack.count() {
                    let last = stack.front()!
                    if last == e {
                        break
                    } else if last > e {
                        stack.pop()
                        blocks += 1
                    } else {
                        stack.push(e)
                        break
                    }
                }
                if stack.count() == 0 {
                    stack.push(e)
                }
            }
        }
        
        return blocks + stack.count()
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
