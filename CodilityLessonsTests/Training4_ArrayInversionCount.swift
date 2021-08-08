//
//  Training4_ArrayInversionCount.swift
//  CodilityLessons
//
//  Created by Oleksandr Malovichko on 4/18/17.
//
//

import XCTest

/*
 ArrayInversionCount
 Compute number of inversion in an array.
 
 
 An array A consisting of N integers is given. An inversion is a pair of indexes (P, Q) such that P < Q and A[Q] < A[P].
 
 Write a function:
 
 public func solution(_ A : inout [Int]) -> Int
 that computes the number of inversions in A, or returns −1 if it exceeds 1,000,000,000.
 
 For example, in the following array:
 
 A[0] = -1 A[1] = 6 A[2] = 3
 A[3] =  4 A[4] = 7 A[5] = 4
 there are four inversions:
 
 (1,2)  (1,3)  (1,5)  (4,5)
 so the function should return 4.
 
 Write an efficient algorithm for the following assumptions:
 
 N is an integer within the range [0..100,000];
 each element of array A is an integer within the range [−2,147,483,648..2,147,483,647].
*/

class Lesson99_ArrayInversionCount: XCTestCase {
    
    func test() {
        
        var arr = [Int]()
        
        arr = [6, 5, 4, 3, 2, 1]
        XCTAssertEqual(solution(&arr), 15)
        
        arr = [-4, -3, -2, -1]
        XCTAssertEqual(solution(&arr), 0)
        
        arr = [1, -1, 5, -4]
        XCTAssertEqual(solution(&arr), 4)
        
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
        
        arr = [1, 1, 1]
        XCTAssertEqual(solution(&arr), 0)
    }
    
    func testAVLTree() {
        // Left Right case
        let lr = AVLTree(43)
        lr.insert(18)
        lr.insert(22)
        XCTAssertEqual(lr.root.height, 2)
        XCTAssertEqual(lr.root.key, 22)
        XCTAssertEqual(lr.root.left?.key, 18)
        XCTAssertEqual(lr.root.right?.key, 43)

        // Right Left case
        let rl = AVLTree(3)
        rl.insert(5)
        rl.insert(4)
        XCTAssertEqual(rl.root.height, 2)
        XCTAssertEqual(rl.root.key, 4)
        XCTAssertEqual(rl.root.left?.key, 3)
        XCTAssertEqual(rl.root.right?.key, 5)

        // Right Right case
        let rr = AVLTree(3)
        rr.insert(4)
        rr.insert(5)
        XCTAssertEqual(rr.root.height, 2)
        XCTAssertEqual(rr.root.key, 4)
        XCTAssertEqual(rr.root.left?.key, 3)
        XCTAssertEqual(rr.root.right?.key, 5)

        // Left Left case
        let ll = AVLTree(22)
        ll.insert(18)
        ll.insert(43)
        ll.insert(9)
        ll.insert(21)
        ll.insert(6)
        XCTAssertEqual(ll.root.height, 3)
        XCTAssertEqual(ll.root.key, 18)
        XCTAssertEqual(ll.root.left?.key, 9)
        XCTAssertEqual(ll.root.left?.left?.key, 6)
        XCTAssertEqual(ll.root.right?.left?.key, 21)
        XCTAssertEqual(ll.root.right?.right?.key, 43)
    }
    
    func testPerformance1() {
        var arr = [Int]()
        let count = 3_000
        for i in 0..<count {
            arr.append(count / 2 - i)
        }
        measure {
            XCTAssertEqual(self.solution(&arr), 4498500)
        }
    }

    func testPerformance2() {
        var arr = [Int]()
        for i in 0..<3_000 {
            arr.append(i)
        }
        measure {
            XCTAssertEqual(self.solution(&arr), 0)
        }
    }
    
    func testPerformance3() {
        var arr = [Int]()
        let count = 100_000
        for i in 0..<count {
            arr.append(count - i)
        }
        measure {
            XCTAssertEqual(self.solution(&arr), -1)
        }
    }
    
    public func solution(_ A : inout [Int]) -> Int {
        let count = A.count
        if count <= 1 {
            return 0
        }
        
        let tree = AVLTree(A[0])
        
        for i in 1..<count {
            tree.insert(A[i])
            if tree.numberOfInversions > 1_000_000_000 {
                return -1
            }
        }
        
        return tree.numberOfInversions
    }

    class AVLTree {
        
        var root: Node
        var numberOfInversions = 0
        
        init(_ newKey: Int) {
            root = Node(newKey)
        }
        
        func insert(_ newKey: Int) {
            root = insert(root, newKey)
        }
        
        private func insert(_ node: Node, _ newKey: Int) -> Node {
            guard node.key != newKey else {
                node.count += 1
                numberOfInversions += node.rightCount
                return node
            }
            
            if node.key > newKey {
                node.leftCount += 1
                if let l = node.left {
                    node.left = insert(l, newKey)
                    
                    let rightHeight = node.right?.height ?? 0
                    node.height = 1 + max(l.height, rightHeight)
                    node.balance = l.height - rightHeight
                    numberOfInversions += node.count + node.rightCount
                    
                    return balance(node)
                } else {
                    node.left = Node(newKey)
                    
                    let rightHeight = node.right?.height ?? 0
                    node.height = 1 + max(1, rightHeight)
                    node.balance = 1 - rightHeight
                    numberOfInversions += node.count + node.rightCount
                    
                    return node
                }
                
            } else {
                node.rightCount += 1
                if let r = node.right {
                    node.right = insert(r, newKey)
                    
                    let leftHeight = node.left?.height ?? 0
                    node.height = 1 + max(leftHeight, r.height)
                    node.balance = leftHeight - r.height
        
                    return balance(node)
                } else {
                    node.right = Node(newKey)
                    
                    let leftHeight = node.left?.height ?? 0
                    node.height = 1 + max(leftHeight, 1)
                    node.balance = leftHeight - 1
                    
                    return node
                }
            }
        }
        
        func rotateRight(_ node: Node) -> Node {
            let newTop = node.left!
            
            node.left = newTop.right
            node.leftCount = newTop.rightCount
            
            newTop.right = node
            newTop.rightCount = node.count + node.leftCount + node.rightCount
            
            updateNodeHeightAndBalance(node)
            updateNodeHeightAndBalance(newTop)
            
            return newTop
        }
        
        func rotateLeft(_ node: Node) -> Node {
            let newTop = node.right!
            
            node.right = newTop.left
            node.rightCount = newTop.leftCount
            
            newTop.left = node
            newTop.leftCount = node.count + node.leftCount + node.rightCount
            
            updateNodeHeightAndBalance(node)
            updateNodeHeightAndBalance(newTop)
            
            return newTop
        }
        
        func updateNodeHeightAndBalance(_ node: Node) {
            let leftHeight = node.left?.height ?? 0
            let rightHeight = node.right?.height ?? 0
            
            node.height = 1 + max(leftHeight, rightHeight)
            node.balance = leftHeight - rightHeight
        }
        
        func balance(_ node: Node) -> Node {
            
            if let leftBalance = node.left?.balance, node.balance > 1 {
                if leftBalance < 0 {
                    // Left Right Case"
                    node.left = rotateLeft(node.left!)
                    return rotateRight(node)
                } else {
                    // Left Left Case"
                    return rotateRight(node)
                }
            } else if let rightBalance = node.right?.balance, node.balance < -1 {
                if rightBalance < 0 {
                    // Right Right Case"
                    return rotateLeft(node)
                } else {
                    // Right Left Case
                    node.right = rotateRight(node.right!)
                    return rotateLeft(node)
                }
            }
            
            return node
        }
    }
    
    class Node {
        var key: Int
        var count = 1
        var height = 1
        var balance = 0
        
        var left: Node?
        var leftCount = 0
        
        var right: Node?
        var rightCount = 0
        
        init(_ key: Int) {
            self.key = key
        }
    }
    
}
