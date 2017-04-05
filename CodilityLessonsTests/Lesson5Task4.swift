//
//  L5_4.swift
//  CodilityLessons
//
//  Created by Oleksandr Malovichko on 3/30/17.
//  Copyright © 2017 MAG. All rights reserved.
//

import XCTest

class L5_4: XCTestCase {
    
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
        
        
        
//        let factors: Dictionary<Character, Int> = ["A": 1, "C": 2, "G": 3, "T": 4]
        
//        let sCount = S.characters.count

        let iterations = min(P.count, Q.count)
        
        var result = [Int]()
        
        for i in 0...iterations - 1 {
//            let c = S.characters
            
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
    
//    public func solution(_ S : inout String, _ P : inout [Int], _ Q : inout [Int]) -> [Int] {
//        let factors: Dictionary<Character, Int> = ["A": 1, "C": 2, "G": 3, "T": 4]
//
//        let sCount = S.characters.count
//        
//        var prefixSums = [Int](repeatElement(0, count: sCount))
//        
//        for k in 1...sCount {
//            let index = S.index(S.startIndex, offsetBy: k)
//            let c = S[index]
//            
//            prefixSums[k] = prefixSums[k - 1] + factors[c]!
//        }
//        
//        let iterations = min(P.count, Q.count)
//        
//        var result = [Int]()
//        
//        for i in 0...iterations - 1 {
//            let c = S.characters
//            let range = c.index(c.startIndex, offsetBy: P[i])..<c.index(c.startIndex, offsetBy: Q[i] + 1)
//            let substring = S.substring(with: range)
////            print(substring)
////            let x = substring.characters.min
////            print(x!)
////            result.append(factors[x!]!)
////            P[y + 1] - P[x]
//        }
//        return result
//    }
    
//    let factors: Dictionary<Character, Int> = ["A": 1, "C": 2, "G": 3, "T": 4]
//
//    public func solution(_ S : inout String, _ P : inout [Int], _ Q : inout [Int]) -> [Int] {
//        let iterations = min(P.count, Q.count)
//        
//        var ranges: Array<(from: Int, to: Int)> = []
//        
//        for i in 0...iterations - 1 {
//            ranges.append((from: P[i], to: Q[i]))
//        }
//        
//        var result = [Int](repeatElement(4, count: iterations))
//        
//        var eIndex = 0
//        for e in S.characters {
//            
//            var index = 0
//            for (start, end) in ranges {
//                if eIndex >= start && eIndex <= end {
//                    result[index] = min(result[index], factors[e]!)
//                }
//                index += 1
//            }
//            
//            eIndex += 1
//        }
//
//        return result
//    }
    
//    func getMinimalImpactFactor(_ s: String) -> Int {
//        var minFactor = 4
//        for e in s.characters {
//            if factors[e] == minFactor {
//                continue
//            }
//            if e == "A" {
//                return 1
//            }
//            let factor = factors[e]!
//            if minFactor > factor {
//                minFactor = factor
//            }
//        }
//        return minFactor
//    }
}
