//
//  Training4_StrSymmetryPoint.swift
//  CodilityLessons
//
//  Created by Oleksandr Malovichko on 4/18/17.
//
//

import XCTest

/*
 StrSymmetryPoint
 Find a symmetry point of a string, if any.
 
 
 Write a function:
 
 public func solution(_ S : inout String) -> Int
 
 that, given a string S, returns the index (counting from 0) of a character such that the part of the string to the left of that character is a reversal of the part of the string to its right. The function should return −1 if no such index exists.
 
 Note: reversing an empty string (i.e. a string whose length is zero) gives an empty string.
 
 For example, given a string:
 
 "racecar"
 
 the function should return 3, because the substring to the left of the character "e" at index 3 is "rac", and the one to the right is "car".
 
 Given a string:
 
 "x"
 
 the function should return 0, because both substrings are empty.
 
 Write an efficient algorithm for the following assumptions:
 
 the length of S is within the range [0..2,000,000].
*/

class Lesson99_StrSymmetryPoint: XCTestCase {
    
    func test() {
        var s = ""
        
        s = "racecar"
        XCTAssertEqual(solution(&s), 3)
    }
    
    public func solution(_ S : inout String) -> Int {
        let count = S.count
        
        if count == 1 {
            return 0
        }
        
        if count % 2 == 0 || count == 0 {
            return -1
        }
        
        let center = count / 2
        
        let left = S.index(S.startIndex, offsetBy: center)
        let right = S.index(S.startIndex, offsetBy: count - center)
        
        let leftSubstring = S[..<left]
        let rightReversedSubstring = String(S[right...].reversed())
        
        return leftSubstring == rightReversedSubstring ? center : -1
    }
}
