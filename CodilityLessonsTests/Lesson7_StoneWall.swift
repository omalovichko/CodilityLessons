//
//  Lesson7Task4.swift
//  CodilityLessons
//
//  Created by Oleksandr Malovichko on 4/12/17.
//
//

import XCTest

/*
 StoneWall
 Cover "Manhattan skyline" using the minimum number of rectangles.
 
 
 You are going to build a stone wall. The wall should be straight and N meters long, and its thickness should be constant; however, it should have different heights in different places. The height of the wall is specified by an array H of N positive integers. H[I] is the height of the wall from I to I+1 meters to the right of its left end. In particular, H[0] is the height of the wall's left end and H[N−1] is the height of the wall's right end.
 
 The wall should be built of cuboid stone blocks (that is, all sides of such blocks are rectangular). Your task is to compute the minimum number of blocks needed to build the wall.
 
 Write a function:
 
 public func solution(_ H : inout [Int]) -> Int
 that, given an array H of N positive integers specifying the height of the wall, returns the minimum number of blocks needed to build it.
 
 For example, given array H containing N = 9 integers:
 
 H[0] = 8    H[1] = 8    H[2] = 5
 H[3] = 7    H[4] = 9    H[5] = 8
 H[6] = 7    H[7] = 4    H[8] = 8
 the function should return 7. The figure shows one possible arrangement of seven blocks.
 
 
 
 Write an efficient algorithm for the following assumptions:
 
 N is an integer within the range [1..100,000];
 each element of array H is an integer within the range [1..1,000,000,000].
*/

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
