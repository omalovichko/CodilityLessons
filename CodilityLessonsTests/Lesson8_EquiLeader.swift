//
//  Lesson8_EquiLeader.swift
//  CodilityLessons
//
//  Created by Oleksandr Malovichko on 4/12/17.
//
//

import XCTest

class Lesson8_EquiLeader: XCTestCase {
    
    func test() {
        var arr = [4, 3, 4, 4, 4, 2]
        XCTAssertEqual(solution(&arr), 2)
        
        var arr2 = [0]
        XCTAssertEqual(solution(&arr2), 0)

        var arr3 = [1, 2, 1, 1, 2, 1]
        XCTAssertEqual(solution(&arr3), 3)
    }
    
    func testPerfomance1() {
        measure {
            var arr4 = Array<Int>(repeatElement(0, count: 100_000))
            XCTAssertEqual(self.solution(&arr4), 99999)
        }
    }
    
    func testPerfomance2() {
        measure {
            var arr5 = [1]
            arr5.append(contentsOf: Array<Int>(repeatElement(0, count: 100_000)))
            arr5.append(1)
            XCTAssertEqual(self.solution(&arr5), 99997)
        }
    }

    public func solution(_ A : inout [Int]) -> Int {
        let count = A.count
        
        if count <= 1 {
            return 0
        }
        
        var leftEquiLeaders = Dictionary<Int, Int>(minimumCapacity: count)
        
        var leftCounts = Dictionary<Int, Int>(minimumCapacity: count)
        var maxLeft = (value: Int.min, count: 0)
        
        for s in 0..<count {
            // Left side leader
            let l = A[s]
            var newCount = 1
            if let currentCount = leftCounts[l] {
                newCount += currentCount
            }
            
            leftCounts[l] = newCount
            
            if maxLeft.count < newCount {
                maxLeft = (l, newCount)
            }
            
            if maxLeft.count >= (s + 1) / 2 + 1 {
                leftEquiLeaders[s] = maxLeft.value
            }
        }
        
        var leadersCount = 0
        
        var rightCounts = Dictionary<Int, Int>(minimumCapacity: count)
        var maxRight = (value: Int.min, count: 0)
        
        for s in 0..<count {
            // Right side leader
            // It is possible to count only left equi leaders (if exist) to improve performance
            let rightIndex = count - 1 - s
            let r = A[rightIndex]
            var newCount = 1
            if let currentCount = rightCounts[r] {
                newCount += currentCount
            }
            
            rightCounts[r] = newCount
            
            if maxRight.count < newCount {
                maxRight = (r, newCount)
            }
            
            let rs = rightIndex - 1
            
            if maxRight.count >= (count - rightIndex) / 2 + 1 {
                if let leftLeader = leftEquiLeaders[rs], leftLeader == maxRight.value {
                    leadersCount += 1
                }
            }
        }

        return leadersCount
    }

}
