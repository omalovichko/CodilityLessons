//
//  Lesson9_MaxDoubleSliceSum.swift
//  CodilityLessons
//
//  Created by Oleksandr Malovichko on 4/14/17.
//
//

import XCTest

class Lesson9_MaxDoubleSliceSum: XCTestCase {
    
    func test() {
        var a = [Int]()
        
        a = [0, 1, -1, -1, 10, 0]
        XCTAssertEqual(solution(&a), 9)
        
        a = [3, 2, 6, -20, 4, 5, -1, 2]
        XCTAssertEqual(solution(&a), 8 + 9)
        
        a = [3, 2, 6, -1, 4, 5, -1, 2]
        XCTAssertEqual(solution(&a), 8 + 9)
        
        a = [3, 2, 6, -1, 4, 5, -1, -1, -1, -1, -1, -1, 2]
        XCTAssertEqual(solution(&a), 8 + 9)
        
        a = [1, 2, -1, 2, 1]
        XCTAssertEqual(solution(&a), 4)
        
        a = [0, 2, -20, -20, 2, 0]
        XCTAssertEqual(solution(&a), 2)
        
        a = [6, 1, 5, 6, 4, 2, 9, 4]
        XCTAssertEqual(solution(&a), 26)
        
        a = [0, -100, 1, 0]
        XCTAssertEqual(solution(&a), 1)
        
        a = [0, 1, -100, 0]
        XCTAssertEqual(solution(&a), 1)
        
        a = [0, 0, 1, 0]
        XCTAssertEqual(solution(&a), 1)
        
        a = [0, -100, -100, -100, 1, -100, -100, -100, 0]
        XCTAssertEqual(solution(&a), 1)
    }
    
    public func solution(_ A : inout [Int]) -> Int {
        if A.count == 3 {
            return 0
        }
        
        A.removeFirst()
        A.removeLast()
        
        let count = A.count
        
        var currentSlice = Slice(value: A.first!, startIndex: 0, endIndex: 0)

        var slices = [0: Slice(value: A.first!, startIndex: 0, endIndex: 0)]

        for i in 1..<count {
            let value = A[i]
            
            if value > currentSlice.sum + value {
                currentSlice = Slice(value: value, startIndex: i, endIndex: i)
            } else {
                currentSlice.addValue(value: value)
            }
            
            let slice = slices[currentSlice.startIndex]
            if slice == nil {
                slices[currentSlice.startIndex] = currentSlice
            } else if let slice = slice, slice.sum < currentSlice.sum {
                slices[currentSlice.startIndex] = currentSlice
            }
        }
        
        var maxDoubleSliceSum = A.first!
        
        for (_, slice) in slices {
            if slice.size() != count {
                maxDoubleSliceSum = max(maxDoubleSliceSum, slice.sum)
            }
            maxDoubleSliceSum = max(maxDoubleSliceSum, slice.sum - slice.minValue)
            if let rightSlice = slices[slice.endIndex + 2] {
                maxDoubleSliceSum = max(maxDoubleSliceSum, slice.sum + rightSlice.sum)
            }
        }
        
        return maxDoubleSliceSum
    }
    
    struct Slice {
        var sum = 0
        var startIndex = 0
        var endIndex = 0
        var minValue = 0
        
        init(value: Int, startIndex: Int, endIndex: Int) {
            self.startIndex = startIndex
            self.endIndex = endIndex
            sum = value
            minValue = value
        }
        
        func size() -> Int {
            return endIndex - startIndex + 1
        }
        
        mutating func addValue(value: Int) {
            sum += value
            minValue = min(minValue, value)
            endIndex += 1
        }
    }
    
}
