//
//  Lesson5_GenomicRangeQuery.swift
//  CodilityLessons
//
//  Created by Oleksandr Malovichko on 3/30/17.
//  
//

import XCTest

/*
 GenomicRangeQuery
 Find the minimal nucleotide from a range of sequence DNA.
 
 
 A DNA sequence can be represented as a string consisting of the letters A, C, G and T, which correspond to the types of successive nucleotides in the sequence. Each nucleotide has an impact factor, which is an integer. Nucleotides of types A, C, G and T have impact factors of 1, 2, 3 and 4, respectively. You are going to answer several queries of the form: What is the minimal impact factor of nucleotides contained in a particular part of the given DNA sequence?
 
 The DNA sequence is given as a non-empty string S = S[0]S[1]...S[N-1] consisting of N characters. There are M queries, which are given in non-empty arrays P and Q, each consisting of M integers. The K-th query (0 ≤ K < M) requires you to find the minimal impact factor of nucleotides contained in the DNA sequence between positions P[K] and Q[K] (inclusive).
 
 For example, consider string S = CAGCCTA and arrays P, Q such that:
 
 P[0] = 2    Q[0] = 4
 P[1] = 5    Q[1] = 5
 P[2] = 0    Q[2] = 6
 The answers to these M = 3 queries are as follows:
 
 The part of the DNA between positions 2 and 4 contains nucleotides G and C (twice), whose impact factors are 3 and 2 respectively, so the answer is 2.
 The part between positions 5 and 5 contains a single nucleotide T, whose impact factor is 4, so the answer is 4.
 The part between positions 0 and 6 (the whole string) contains all nucleotides, in particular nucleotide A whose impact factor is 1, so the answer is 1.
 Write a function:
 
 public func solution(_ S : inout String, _ P : inout [Int], _ Q : inout [Int]) -> [Int]
 that, given a non-empty string S consisting of N characters and two non-empty arrays P and Q consisting of M integers, returns an array consisting of M integers specifying the consecutive answers to all queries.
 
 Result array should be returned as an array of integers.
 
 For example, given the string S = CAGCCTA and arrays P, Q such that:
 
 P[0] = 2    Q[0] = 4
 P[1] = 5    Q[1] = 5
 P[2] = 0    Q[2] = 6
 the function should return the values [2, 4, 1], as explained above.
 
 Write an efficient algorithm for the following assumptions:
 
 N is an integer within the range [1..100,000];
 M is an integer within the range [1..50,000];
 each element of arrays P, Q is an integer within the range [0..N − 1];
 P[K] ≤ Q[K], where 0 ≤ K < M;
 string S consists only of upper-case English letters A, C, G, T.
*/

class Lesson5_GenomicRangeQuery: XCTestCase {
    
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
        var prefixSumA = S.map({ () -> (Character) -> Int in
            var s = 0; return {
                if $0 == "A" {
                    return (s += 1, s).1
                }
                return s
            }
            }())
        prefixSumA.insert(0, at: 0)
        var prefixSumC = S.map({ () -> (Character) -> Int in
            var s = 0; return {
                if $0 == "C" {
                    return (s += 1, s).1
                }
                return s
            }
            }())
        prefixSumC.insert(0, at: 0)
        var prefixSumG = S.map({ () -> (Character) -> Int in
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
