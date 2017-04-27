//
//  Lesson15_CountDistinctSlices.swift
//  CodilityLessons
//
//  Created by Oleksandr Malovichko on 4/25/17.
//
//

import XCTest

class Lesson15_CountDistinctSlices: XCTestCase {
    
    func test() {
        var a = [Int]()
        // TODO:
//        a = [10, 1, 10, 11]
//        XCTAssertEqual(solution(11, &a), 8)
//        
//        a = [3, 4, 5, 5, 2]
//        XCTAssertEqual(solution(6, &a), 9)
//        
//        a = [5, 5, 5, 5, 5]
//        XCTAssertEqual(solution(5, &a), 5)
//        
//        a = [1, 2, 3, 4, 5]
//        XCTAssertEqual(solution(5, &a), 15)
    }
    
    public func solution(_ M : Int, _ A : inout [Int]) -> Int {
        var distinctSlices = Set<Slice>()
        
        calcSlices(slices: &distinctSlices, a: A)
        calcSlices(slices: &distinctSlices, a: A.reversed())
        return distinctSlices.count
    }
    
    func calcSlices(slices: inout Set<Slice>, a: [Int]) {
        var slice = Set<Int>()
        var index = (left: 0, right: 0)
        
        for i in 0..<a.count {
            let value = a[i]
            if slice.contains(value) {
                slices.insert(Slice(index.left, index.right))
                slice.removeAll()
                index = (i, i)
            } else {
                index.right += 1
            }
            slice.insert(value)
        }
        slices.insert(Slice(index.left, index.right))
    }
    
    struct Slice: Hashable {
        
        var leftIndex: Int
        var rightIndex: Int
        
        init(_ leftIndex: Int, _ rightIndex: Int) {
            self.leftIndex = leftIndex
            self.rightIndex = rightIndex
        }
        
        public var hashValue: Int {
            return "\(leftIndex):\(rightIndex)".hashValue
        }
        
        public static func ==(lhs: Slice, rhs: Slice) -> Bool {
            return lhs.leftIndex == rhs.leftIndex && lhs.rightIndex == rhs.rightIndex
        }
    }
}
