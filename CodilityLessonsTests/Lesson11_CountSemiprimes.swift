//
//  Lesson11_CountSemiprimes.swift
//  CodilityLessonsTests
//
//  Created by Oleksandr Malovichko on 15.06.2019.
//

import XCTest

/*
 CountSemiprimes
 Count the semiprime numbers in the given range [a..b]
 
 
 A prime is a positive integer X that has exactly two distinct divisors: 1 and X. The first few prime integers are 2, 3, 5, 7, 11 and 13.
 
 A semiprime is a natural number that is the product of two (not necessarily distinct) prime numbers. The first few semiprimes are 4, 6, 9, 10, 14, 15, 21, 22, 25, 26.
 
 You are given two non-empty arrays P and Q, each consisting of M integers. These arrays represent queries about the number of semiprimes within specified ranges.
 
 Query K requires you to find the number of semiprimes within the range (P[K], Q[K]), where 1 ≤ P[K] ≤ Q[K] ≤ N.
 
 For example, consider an integer N = 26 and arrays P, Q such that:
 
 P[0] = 1    Q[0] = 26
 P[1] = 4    Q[1] = 10
 P[2] = 16   Q[2] = 20
 The number of semiprimes within each of these ranges is as follows:
 
 (1, 26) is 10,
 (4, 10) is 4,
 (16, 20) is 0.
 Write a function:
 
 public func solution(_ N : Int, _ P : inout [Int], _ Q : inout [Int]) -> [Int]
 that, given an integer N and two non-empty arrays P and Q consisting of M integers, returns an array consisting of M elements specifying the consecutive answers to all the queries.
 
 For example, given an integer N = 26 and arrays P, Q such that:
 
 P[0] = 1    Q[0] = 26
 P[1] = 4    Q[1] = 10
 P[2] = 16   Q[2] = 20
 the function should return the values [10, 4, 0], as explained above.
 
 Write an efficient algorithm for the following assumptions:
 
 N is an integer within the range [1..50,000];
 M is an integer within the range [1..30,000];
 each element of arrays P, Q is an integer within the range [1..N];
 P[i] ≤ Q[i].
*/

class Lesson11_CountSemiprimes: XCTestCase {
    
    func test() {
        var p = [Int]()
        var q = [Int]()
        
        p = [1]
        q = [1]
        XCTAssertEqual(solution(1, &p, &q), [0])
        
        p = [1, 4, 16]
        q = [26, 10, 20]
        XCTAssertEqual(solution(26, &p, &q), [10, 4, 0])
    }
    
    public func solution(_ N : Int, _ P : inout [Int], _ Q : inout [Int]) -> [Int] {
        guard N > 1 else {
            return [0]
        }
        
        var primeNumbers = Set<Int>()
        // key: number, value: factor
        var compositeNumbers = [Int: Int]()
        
        // Sieve of Eratosthenes
        for number in 2...N {
            guard compositeNumbers[number] == nil else {
                continue
            }
            primeNumbers.insert(number)
            
            var k = number * number
            while k <= N {
                compositeNumbers[k] = number
                k += number
            }
        }
        
        var semiprimes = Set<Int>()
        for entry in compositeNumbers {
            let factor = entry.key / entry.value
            if primeNumbers.contains(factor) {
                semiprimes.insert(entry.key)
            }
        }
        
        // key: number, value: number of semiprimes
        var semiprimesPrefixSums = [Int: Int]()
        semiprimesPrefixSums[0] = 0
        var sum = 0
        for i in 1...N {
            if semiprimes.contains(i) {
                sum += 1
            }
            semiprimesPrefixSums[i] = sum
        }
        
        var result = [Int]()
        
        for i in 0..<P.count {
            let left = semiprimesPrefixSums[P[i] - 1]!
            let right = semiprimesPrefixSums[Q[i]]!
            result.append(right - left)
        }
        
        return result
    }
}
