//
//  Lesson99_ArrayInversionCount.swift
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
        let lr = Node(43).insert(18).node.insert(22).node
        XCTAssertEqual(lr.height, 2)
        XCTAssertEqual(lr.key, 22)
        XCTAssertEqual(lr.left?.key, 18)
        XCTAssertEqual(lr.right?.key, 43)
        
        // Right Left case
        let rl = Node(3).insert(5).node.insert(4).node
        XCTAssertEqual(rl.height, 2)
        XCTAssertEqual(rl.key, 4)
        XCTAssertEqual(rl.left?.key, 3)
        XCTAssertEqual(rl.right?.key, 5)
        
        // Right Right case
        let rr = Node(3).insert(4).node.insert(5).node
        XCTAssertEqual(rr.height, 2)
        XCTAssertEqual(rr.key, 4)
        XCTAssertEqual(rr.left?.key, 3)
        XCTAssertEqual(rr.right?.key, 5)
        
        // Left Left case
        let ll = Node(22).insert(18).node.insert(43).node.insert(9).node.insert(21).node.insert(6).node
        XCTAssertEqual(ll.height, 3)
        XCTAssertEqual(ll.key, 18)
        XCTAssertEqual(ll.left?.key, 9)
        XCTAssertEqual(ll.left?.left?.key, 6)
        XCTAssertEqual(ll.right?.left?.key, 21)
        XCTAssertEqual(ll.right?.right?.key, 43)
    }
    
    func testMeasure1() {
        var arr = [Int]()
        let count = 3_000
        for i in 0..<count {
            arr.append(count / 2 - i)
        }
        measure {
            XCTAssertEqual(self.solution(&arr), 4498500)
        }
    }
    
    func testMeasure2() {
        var arr = [Int]()
        for i in 0..<3_000 {
            arr.append(i)
        }
        measure {
            XCTAssertEqual(self.solution(&arr), 0)
        }
    }
    
    func testMeasure3() {
        // Time: 0.491 sec
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
        
        var head = Node(A[0])
        var numberOfInversions = 0
        
        for i in 1..<count {
            let a = A[i]
            
            let result = head.insert(a)
            numberOfInversions += result.numberOfInversions
            head = result.node
            
            if numberOfInversions > 1_000_000_000 {
                return -1
            }
        }
        
        return numberOfInversions
    }

    // AVL Tree
    class Node {
        var key: Int
        var count = 1
        
        var height = 1
        var balance: Int {
            return (left?.height ?? 0) - (right?.height ?? 0)
        }
        
        var left : Node?
        var leftCount = 0
        
        var right : Node?
        var rightCount = 0
        
        init(_ key: Int) {
            self.key = key
        }
        
        func insert(_ newKey: Int) -> (numberOfInversions: Int, node: Node) {
            
            var numberOfInversions = 0
            
            if self.key == newKey {
                count += 1
                numberOfInversions += rightCount
            } else if key > newKey {
                leftCount += 1
                if let l = left {
                    let result = l.insert(newKey)
                    left = result.node
                    
                    height = 1 + max(l.height, right?.height ?? 0)
                    numberOfInversions += count + rightCount + result.numberOfInversions
                } else {
                    left = Node(newKey)
                    
                    height = 1 + max(1, right?.height ?? 0)
                    numberOfInversions += count + rightCount
                }
                
            } else {
                rightCount += 1
                if let r = right {
                    let result = r.insert(newKey)
                    right = result.node
                    
                    height = 1 + max(left?.height ?? 0, r.height)
                    numberOfInversions += result.numberOfInversions
                } else {
                    right = Node(newKey)
                    
                    height = 1 + max(left?.height ?? 0, 1)
                }
            }
            
            return (numberOfInversions, balanced())
        }
        
        func rotateRight() -> Node {
            let newTop = left!
            
            left = newTop.right
            leftCount = newTop.rightCount
            
            newTop.right = self
            newTop.rightCount = count + leftCount + rightCount
            
            // Update heights
            height = 1 + max(left?.height ?? 0, right?.height ?? 0)
            newTop.height = 1 + max(newTop.left?.height ?? 0, newTop.right?.height ?? 0)

            return newTop
        }
        
        func rotateLeft() -> Node {
            let newTop = right!
            
            right = newTop.left
            rightCount = newTop.leftCount
            
            newTop.left = self
            newTop.leftCount = count + leftCount + rightCount
            
            // Update heights
            height = 1 + max(left?.height ?? 0, right?.height ?? 0)
            newTop.height = 1 + max(newTop.left?.height ?? 0, newTop.right?.height ?? 0)
            
            return newTop
        }
        
        func balanced() -> Node {
            
            let nodeBalance = balance
            
            if let leftBalance = left?.balance, nodeBalance > 1 {
                if leftBalance < 0 {
                    // Left Right Case
                    left = left?.rotateLeft()
                    return rotateRight()
                } else {
                    // Left Left Case
                    return rotateRight()
                }
            } else if let rightBalance = right?.balance, nodeBalance < -1 {
                if rightBalance < 0 {
                    // Right Right Case
                    return rotateLeft()
                } else {
                    // Right Left Case
                    right = right?.rotateRight()
                    return rotateLeft()
                }
            }
            
            return self
        }
        
    }
}
