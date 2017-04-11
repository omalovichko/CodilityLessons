//
//  Lesson7Task1.swift
//  CodilityLessons
//
//  Created by Oleksandr Malovichko on 4/11/17.
//
//

import XCTest

class Lesson7Task1: XCTestCase {
    
    func test() {
        var s = "{[()()]}"
        XCTAssertEqual(solution(&s), 1)
        
        var s1 = "([)()]"
        XCTAssertEqual(solution(&s1), 0)
        
        var s2 = ""
        XCTAssertEqual(solution(&s2), 1)
        
        measure { 
            var s3 = ""
            for _ in 1...100_000 {
                s3 += "("
            }
            for _ in 1...100_000 {
                s3 += ")"
            }
            XCTAssertEqual(self.solution(&s3), 1)
        }
    }
    
    public func solution(_ S : inout String) -> Int {
        let count = S.characters.count
        if count == 0 {
            return 1
        }
        let dict: Dictionary<Character, Character> = ["{": "}", "[": "]", "(": ")"]
        var stack = Stack<Character>()
        for c in S.characters {
            if c == "{" || c == "[" || c == "(" {
                stack.push(c)
            } else if let last = stack.front(), dict[last] == c {
                stack.pop()
            } else {
                return 0
            }
        }
        return stack.count() == 0 ? 1 : 0
    }
    
    struct Stack<T> {
        private var array = [T]()
        
        public func count() -> Int {
            return array.count
        }
        
        public mutating func push(_ element: T) {
            array.append(element)
        }
        
        public mutating func pop() -> T? {
            return array.removeLast()
        }
        
        public func front() -> T? {
            return array.last
        }
    }
    
}
