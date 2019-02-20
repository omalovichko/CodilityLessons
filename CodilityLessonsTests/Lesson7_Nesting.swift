//
//  Lesson7Task3.swift
//  CodilityLessons
//
//  Created by Oleksandr Malovichko on 4/12/17.
//
//

import XCTest

/*
 Nesting
 Determine whether a given string of parentheses (single type) is properly nested.
 
 
 A string S consisting of N characters is called properly nested if:
 
 S is empty;
 S has the form "(U)" where U is a properly nested string;
 S has the form "VW" where V and W are properly nested strings.
 For example, string "(()(())())" is properly nested but string "())" isn't.
 
 Write a function:
 
 public func solution(_ S : inout String) -> Int
 that, given a string S consisting of N characters, returns 1 if string S is properly nested and 0 otherwise.
 
 For example, given S = "(()(())())", the function should return 1 and given S = "())", the function should return 0, as explained above.
 
 Write an efficient algorithm for the following assumptions:
 
 N is an integer within the range [0..1,000,000];
 string S consists only of the characters "(" and/or ")".
*/


class Lesson7_Nesting: XCTestCase {
    
    func test() {
        var s0 = ")("
        XCTAssertEqual(solution(&s0), 0)
        
        var s = "((()(())"
        XCTAssertEqual(solution(&s), 0)
        
        var s1 = "(()())"
        XCTAssertEqual(solution(&s1), 1)
        
        var s2 = ""
        XCTAssertEqual(solution(&s2), 1)
        
        var s3 = "(((("
        XCTAssertEqual(self.solution(&s3), 0)
    }
    
    public func solution(_ S : inout String) -> Int {
        let count = S.count
        if count == 0 {
            return 1
        }
        var stack = Stack<Character>(capacity: count)
        for c in S {
            if c == "(" {
                stack.push(c)
            } else if stack.count() != 0 {
                stack.pop()
            } else {
                return 0
            }
        }
        return stack.count() == 0 ? 1 : 0
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
