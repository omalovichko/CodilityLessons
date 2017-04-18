//
//  Lesson99_TreeHeight.swift
//  CodilityLessons
//
//  Created by Oleksandr Malovichko on 4/18/17.
//
//

import XCTest

class Lesson99_TreeHeight: XCTestCase {
    
    func test() {
        let first = Tree()
        var last = first
        for _ in 0..<3 {
            let newLeft = Tree()
            last.l = newLeft
            last.r = Tree()
            last = newLeft
        }
        XCTAssertEqual(solution(first), 3)
    }
    
    public func solution(_ T : Tree?) -> Int {
        guard let tree = T else {
            return -1
        }
        
        func height(branch: Tree?, h: Int) -> Int {
            guard let branch = branch else {
                return h
            }
            return max(height(branch: branch.l, h: h + 1), height(branch: branch.r, h: h + 1))
        }
        
        return height(branch: tree, h: -1)
    }
    
    public class Tree {
        public var x : Int = 0
        public var l : Tree?
        public var r : Tree?
        public init() {}
    }
}
