//
//  Lesson92_SocksLaundering.swift
//  CodilityLessons
//
//  Created by Oleksandr Malovichko on 4/20/17.
//
//

import XCTest

class Lesson92_SocksLaundering: XCTestCase {
    
    func test() {
        var k = Int()
        var c = [Int]()
        var d = [Int]()
        
        k = 2
        c = [1, 2, 1, 1]
        d = [1, 4, 3, 2, 4]
        XCTAssertEqual(solution(k, &c, &d), 3)
        
        k = 3
        c = [1, 2]
        d = [8, 8, 8, 8, 9]
        XCTAssertEqual(solution(k, &c, &d), 1)
        
        k = 5
        c = [1, 1, 3, 4]
        d = [3, 3, 3, 5]
        XCTAssertEqual(solution(k, &c, &d), 3)
    }
    
    public func solution(_ K : Int, _ C : inout [Int], _ D : inout [Int]) -> Int {
        var washingMachineCapacity = K
        var pairs = 0
        
        var unpairedCleanSocks = Set<Int>()
        
        for c in C {
            if unpairedCleanSocks.remove(c) == nil {
                unpairedCleanSocks.insert(c)
            } else {
                pairs += 1
            }
        }
        
        guard washingMachineCapacity > 0 else {
            return pairs
        }
        
        var dirtySocks = Dictionary<Int, Int>()
        
        for sockColor in D {
            if let count = dirtySocks[sockColor] {
                dirtySocks[sockColor] = count + 1
            } else {
                dirtySocks[sockColor] = 1
            }
        }
        
        for sockColor in unpairedCleanSocks {
            if let count = dirtySocks[sockColor], count > 0 {
                dirtySocks[sockColor] = count - 1
                pairs += 1
                washingMachineCapacity -= 1
                
                if washingMachineCapacity == 0 {
                    return pairs
                }
            }
        }
        
        for (_, count) in dirtySocks {
            let socks = min(count / 2, washingMachineCapacity / 2)
            washingMachineCapacity -= socks * 2
            pairs += socks
            if washingMachineCapacity <= 1 {
                return pairs
            }
        }
        
        return pairs
    }
    
}
