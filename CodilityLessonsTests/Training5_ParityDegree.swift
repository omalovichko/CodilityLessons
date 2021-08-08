//
//  Training5_ParityDegree.swift
//  CodilityLessonsTests
//
//  Created by Oleksandr Malovichko on 08.08.2021.
//

import Foundation
import XCTest

/*
 ParityDegree
 Find the highest power of 2 that divides N.
 
 A positive integer N is given. The goal is to find the highest power of 2 that divides N. In other words, we have to find the maximum K for which N modulo 2^K is 0.

 For example, given integer N = 24 the answer is 3, because 2^3 = 8 is the highest power of 2 that divides N.

 Write a function:

 public func solution(_ N : Int) -> Int
 that, given a positive integer N, returns the highest power of 2 that divides N.

 For example, given integer N = 24, the function should return 3, as explained above.

 Assume that:

 N is an integer within the range [1..1,000,000,000].
 In your solution, focus on correctness. The performance of your solution will not be the focus of the assessment.
*/

class Training5_ParityDegree: XCTestCase {

    func test() {
        XCTAssertEqual(solution(4), 2)
        XCTAssertEqual(solution(24), 3)
    }
    
    public func solution(_ N : Int) -> Int {
        // Number of bits in a decimal integer
        let bitsCount = Int(log2(Double(N))) + 1
        var bitIndex = bitsCount - 1
        while bitIndex >= 0 {
            let number = Int(pow(2, Float(bitIndex)))
            if N % number == 0 {
                return bitIndex
            }
            bitIndex -= 1
        }
        fatalError()
    }
}
