//
//  Training4_DisappearingPairs.swift
//  CodilityLessonsTests
//
//  Created by Oleksandr Malovichko on 10.07.2021.
//

import XCTest

/*
 DisappearingPairs
 Reduce a string containing instances of the letters "A", "B" and "C" via the following rule: remove one occurrence of "AA", "BB" or "CC".
 
 A string S containing only the letters "A", "B" and "C" is given. The string can be transformed by removing one occurrence of "AA", "BB" or "CC".

 Transformation of the string is the process of removing letters from it, based on the rules described above. As long as at least one rule can be applied, the process should be repeated. If more than one rule can be used, any one of them could be chosen.

 Write a function:

 public func solution(_ S : inout String) -> String
 that, given a string S consisting of N characters, returns any string that can result from a sequence of transformations as described above.

 For example, given string S = "ACCAABBC" the function may return "AC", because one of the possible sequences of transformations is as follows:



 Also, given string S = "ABCBBCBA" the function may return "", because one possible sequence of transformations is:



 Finally, for string S = "BABABA" the function must return "BABABA", because no rules can be applied to string S.

 Write an efficient algorithm for the following assumptions:

 the length of S is within the range [0..50,000];
 string S consists only of the following characters: "A", "B" and/or "C".
*/

class Training5_DisappearingPairs: XCTestCase {

    func test() {
        var s = ""

        s = "ACCAABBC"
        XCTAssertEqual(solution(&s), "AC")
        
        s = "ABCBBCBA"
        XCTAssertEqual(solution(&s), "")

        s = "BABABA"
        XCTAssertEqual(solution(&s), "BABABA")
    }
    
    public func solution(_ S : inout String) -> String {
        var result = ""
        for char in S {
            if result.last == char {
                _ = result.popLast()
            } else {
                result.append(char)
            }
        }
        return result
    }
}
