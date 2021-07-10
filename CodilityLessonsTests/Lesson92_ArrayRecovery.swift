//
//  Lesson92_ArrayRecovery.swift
//  CodilityLessonsTests
//
//  Created by Oleksandr Malovichko on 25.07.2019.
//

import XCTest

/*
 ArrayRecovery
 Recover a broken array using partial information in another array.
 
 Bob once had an array A with N elements. Each element was a positive integer not exceeding M.

 Bob wrote a program to find an array B, defined as follows. For every index J, let's find the biggest index K such that K < J and A[K] < A[J]. Then set B[J] = A[K]. If there is no such index K, then set B[J] = 0. Intuitively, the J-th element of B contains the last value smaller than A[J] that appears before it, or 0 if there is no such element.

 For example, let A = [2, 5, 3, 7, 9, 6]. Then B = [0, 2, 2, 3, 7, 3]. For instance, B[5] = 3, as A[5] is 6 and the last value before A[5] smaller than 6 is 3.

 Bob computed an array B and then mistakenly deleted A. He now intends to find every valid array A from which his program would produce B. Count the number of such arrays A. Since the answer could be very big, return it modulo 10^9+7.

 Write a function:

 public func solution(_ B : inout [Int], _ M : Int) -> Int
 that, given an integer M and an array B with N integers, returns the remainder from the division by 10^9+7 of the number of valid arrays A from which Bob would get B. You can assume that there is at least one such array.

 For example, given: M = 4, B = [0, 2, 2] the function should return 3. The possible removed arrays A were [2, 3, 3], [2, 4, 3] and [2, 4, 4].

 For the following data: M = 10, B = [0, 3, 5, 6] the function should return 4, as the possible arrays A were [3, 5, 6, 7], [3, 5, 6, 8], [3, 5, 6, 9] and [3, 5, 6, 10].

 For the following data: M = 10^5, B = [0, 0] there are 5000050000 possible arrays (the first element in array A can be anything in the range 1..10^5 and the second element can be either equal or smaller), so the function should return 49965 (as we are taking modulo 10^9+7).

 Write an efficient algorithm for the following assumptions:

 N is an integer within the range [1..100,000];
 M is an integer within the range [1..1,000,000,000];
 each element of array B is an integer within the range [0..M];
 there exists at least one valid array A from which Bob would get array B.
*/

class Lesson92_ArrayRecovery: XCTestCase {

    func test() {
//        var b = [Int]()
//        var m = 0
//
//        b = [0, 1, 2]
//        m = 2
//        XCTAssertEqual(solution(&b, m), 1)
        
//        b = [0, 2, 2]
//        m = 4
//        XCTAssertEqual(solution(&b, m), 3)

//        b = [0, 3, 5, 6]
//        m = 10
//        XCTAssertEqual(solution(&b, m), 4)
//        
//        b = [0, 0]
//        m = 105
//        XCTAssertEqual(solution(&b, m), 49965)
    }
    
    // https://www.wolframalpha.com/input/?i=%5BSum+%5BSum+%5BSum+1+%7Bz%2C1%2Cy%7D%5D++%7By%2C1%2Cx%7D%5D++%7Bx%2C1%2Cn%7D%5D+
    
    // https://www.wolframalpha.com/input/?i=%5BSum+%5BSum+1+%7By%2Ca%2Cx%7D%5D++%7Bx%2Cb%2Cn%7D%5D
    
    // https://www.cut-the-knot.org/arithmetic/algebra/BinomialReciprocalsInPascal.shtml
    public func solution(_ B : inout [Int], _ M : Int) -> Int {
        assertionFailure("Implement")
        return 0
    }
}
