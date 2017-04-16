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
        var arr0 = [3, 2, 6, -20, 4, 5, -1, 2]
        XCTAssertEqual(solution(&arr0), 8 + 9)
        
        var arr = [3, 2, 6, -1, 4, 5, -1, 2]
        XCTAssertEqual(solution(&arr), 8 + 9)
        
        var arr2 = [3, 2, 6, -1, 4, 5, -1, -1, -1, -1, -1, -1, 2]
        XCTAssertEqual(solution(&arr2), 8 + 9)
        
        var arr3 = [1, 2, -1, 2, 1]
        XCTAssertEqual(solution(&arr3), 4)
        
        var arr4 = [0, 2, -20, -20, 2, 0]
        XCTAssertEqual(solution(&arr4), 2)
    }
    
    public func solution(_ A : inout [Int]) -> Int {
        if A.count == 3 {
            return 0
        }
        
        A.removeFirst()
        A.removeLast()
        
        let count = A.count
        
        var maxDoubleSliceSum = 0
        
        var previousSlices = Dictionary<Int, Slice>()
        
        var currentSlice = Slice(value: A.first!, startIndex: 0, endIndex: 0)

        for i in 1..<count {
            let value = A[i]
            
            if value > currentSlice.sum + value {
                let sum = self.maxDoubleSliceSum(leftSlices: previousSlices, rightSlice: currentSlice)
                maxDoubleSliceSum = max(maxDoubleSliceSum, sum)
                
                previousSlices[currentSlice.endIndex] = currentSlice
                currentSlice = Slice(value: value, startIndex: i, endIndex: i)
                
            } else {
                currentSlice.addValue(value: value)
            }
        }
        
        let sum = self.maxDoubleSliceSum(leftSlices: previousSlices, rightSlice: currentSlice)
        maxDoubleSliceSum = max(maxDoubleSliceSum, sum)
        
        return maxDoubleSliceSum
    }

    func maxDoubleSliceSum(leftSlices: Dictionary<Int, Slice>, rightSlice: Slice) -> Int {
        var maxSum = 0
        let rightSliceMaxSum = max(rightSlice.sum, rightSlice.sum - rightSlice.lastValue)
        maxSum = max(rightSliceMaxSum, maxSum)
        
        let rightSliceMax = max(rightSlice.sum, rightSlice.sum - rightSlice.minValue)
        maxSum = max(rightSliceMax, maxSum)
        
        if let leftSlice = leftSlices[rightSlice.startIndex - 2] {
            maxSum = max(maxSum, leftSlice.sum + rightSliceMaxSum)
        }
        
        if let leftSlice = leftSlices[rightSlice.startIndex - 1] {
            maxSum = max(maxSum, leftSlice.sum - leftSlice.lastValue + rightSliceMaxSum)
        }
        return maxSum
    }
    
    class Slice {
        var sum = 0
        var startIndex = 0
        var endIndex = 0
        var lastValue = 0
        var minValue = 0
        
        init(value: Int, startIndex: Int, endIndex: Int) {
            self.startIndex = startIndex
            self.endIndex = endIndex
            sum = value
            lastValue = value
            minValue = value
        }
        
        func addValue(value: Int) {
            sum += value
            lastValue = value
            minValue = min(minValue, value)
            endIndex += 1
        }
    }
    
}
