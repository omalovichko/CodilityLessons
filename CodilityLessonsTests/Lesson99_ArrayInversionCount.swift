//
//  Lesson99_ArrayInversionCount.swift
//  CodilityLessons
//
//  Created by Oleksandr Malovichko on 4/18/17.
//
//

import XCTest
// TODO: finish it with Merge sort

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
    }
    
    func testMeasure1() {
        measure {
            var arr = [Int]()
            for i in 0..<1_000 {
                arr.append(10_000 - i)
            }
            XCTAssertEqual(self.solution(&arr), 499500)
        }
    }
    
    func testMeasure2() {
        measure {
            var arr = [Int]()
            for i in 0..<1_000 {
                arr.append(i)
            }
            XCTAssertEqual(self.solution(&arr), 0)
        }

    }
    
    public func solution(_ A : inout [Int]) -> Int {
        let count = A.count
        
        if count <= 1 {
            return 0
        }
        
        var result = (tree: Tree(A.first!), count: 0)
        
        for i in 1..<count {
            let a = A[i]
            
            result = insert(tree: result.tree, value: a, count: result.count)
            result.tree = rotateTree(tree: result.tree)
            
            if result.count > 1_000_000_000 {
                return -1
            }
        }
        
        return result.count
    }
    
    func rotateTree(tree: Tree) -> Tree {
        let l = tree.leftCount
        let r = tree.rightCount
        if abs(l - r) < 2 {
            return tree
        }
        if l > r {
            // Right rotation
            let newTop = tree.left!

            tree.left = newTop.right
            tree.leftCount = newTop.rightCount
            
            newTop.right = tree
            newTop.rightCount = tree.count + tree.leftCount + tree.rightCount
            
            return newTop
        } else {
            // Left rotation
            let newTop = tree.right!

            tree.right = newTop.left
            tree.rightCount = newTop.leftCount
            
            newTop.left = tree
            newTop.leftCount = tree.count + tree.leftCount + tree.rightCount
            
            return newTop
        }
    }
    
    func insert(tree: Tree, value: Int, count: Int) -> (Tree, Int) {
        
        var result = count
        
        func insert(tree: Tree) {
            if tree.value > value {
                tree.leftCount += 1
                if let l = tree.left {
                    result += tree.count + tree.rightCount
                    return insert(tree: l)
                }
                tree.left = Tree(value)
                result += tree.count + tree.rightCount
                return
            } else if tree.value < value {
                tree.rightCount += 1
                if let r = tree.right {
                    return insert(tree: r)
                }
                tree.right = Tree(value)
                return
            } else {
                tree.count += 1
                result += tree.rightCount
                return
            }
        }
        
        insert(tree: tree)
        
        return (tree, result)
    }

    class Tree {
        var value: Int
        var count: Int
        
        var left : Tree?
        var leftCount = 0
        
        var right : Tree?
        var rightCount = 0
        
        init(_ value: Int) {
            self.value = value
            count = 1
        }
    }
}
