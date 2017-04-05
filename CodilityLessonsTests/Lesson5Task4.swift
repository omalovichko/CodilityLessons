//
//  L5_4.swift
//  CodilityLessons
//
//  Created by Oleksandr Malovichko on 3/30/17.
//  
//

import XCTest

class Lesson5Task4: XCTestCase {
    
    func test() {
        var s = "CAGCCTA"
        var p = [2, 5, 0]
        var q = [4, 5, 6]
        XCTAssertEqual(solution(&s, &p, &q), [2, 4, 1])
        
        var s1 = "A"
        var p1 = [0]
        var q1 = [0]
        XCTAssertEqual(solution(&s1, &p1, &q1), [1])
    }
    
    public func solution(_ S : inout String, _ P : inout [Int], _ Q : inout [Int]) -> [Int] {
        var prefixSumA = S.characters.map({ () -> (Character) -> Int in
            var s = 0; return {
                if $0 == "A" {
                    return (s += 1, s).1
                }
                return s
            }
            }())
        prefixSumA.insert(0, at: 0)
        var prefixSumC = S.characters.map({ () -> (Character) -> Int in
            var s = 0; return {
                if $0 == "C" {
                    return (s += 1, s).1
                }
                return s
            }
            }())
        prefixSumC.insert(0, at: 0)
        var prefixSumG = S.characters.map({ () -> (Character) -> Int in
            var s = 0; return {
                if $0 == "G" {
                    return (s += 1, s).1
                }
                return s
            }
            }())
        prefixSumG.insert(0, at: 0)
        

        let iterations = min(P.count, Q.count)
        
        var result = [Int]()
        
        for i in 0...iterations - 1 {
            let s = P[i]
            let e = Q[i] + 1
            if prefixSumA[e] - prefixSumA[s] > 0 {
                result.append(1)
            } else if prefixSumC[e] - prefixSumC[s] > 0 {
                result.append(2)
            } else if prefixSumG[e] - prefixSumG[s] > 0 {
                result.append(3)
            } else {
                result.append(4)
            }
        }
        return result
    }

}
