//
//  Lesson92_SocksLaundering.swift
//  CodilityLessons
//
//  Created by Oleksandr Malovichko on 4/20/17.
//
//

import XCTest

/*
 SocksLaundering
 From drawers containing both clean and dirty socks, choose socks to launder in order to obtain the maximum number of clean pairs of socks.
 
 
 Bob is about to go on a trip. But first he needs to take care of his supply of socks. Each sock has its own color. Bob wants to take as many pairs of clean socks as possible (both socks in the pair should be of the same color).
 
 Socks are divided into two drawers: clean and dirty socks. Bob has time for only one laundry and his washing machine can clean at most K socks. He wants to pick socks for laundering in such a way that after washing he will have a maximal number of clean, same-colored pairs of socks. It is possible that some socks cannot be paired with any other sock, because Bob may have lost some socks over the years.
 
 Bob has exactly N clean and M dirty socks, which are described in arrays C and D, respectively. The colors of the socks are represented as integers (equal numbers representing identical colors).
 
 For example, given four clean socks and five dirty socks:
 
 
 
 If Bob's washing machine can clean at most K = 2 socks, then he can take a maximum of three pairs of clean socks. He can wash one red sock and one green sock, numbered 1 and 2 respectively. Then he will have two pairs of red socks and one pair of green socks.
 
 Write a function:
 
 public func solution(_ K : Int, _ C : inout [Int], _ D : inout [Int]) -> Int
 
 that, given an integer K (the number of socks that the washing machine can clean), two arrays C and D (containing the color representations of N clean and M dirty socks respectively), returns the maximum number of pairs of socks that Bob can take on the trip.
 
 For example, given K = 2, C = [1, 2, 1, 1] and D = [1, 4, 3, 2, 4], the function should return 3, as explained above.
 
 Assume that:
 
 K is an integer within the range [0..50];
 each element of arrays C, D is an integer within the range [1..50];
 C and D are not empty and each of them contains at most 50 elements.
 In your solution, focus on correctness. The performance of your solution will not be the focus of the assessment.
*/

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
