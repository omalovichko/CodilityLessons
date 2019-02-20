//
//  Lesson90_LongestPassword.swift
//  CodilityLessons
//
//  Created by Oleksandr Malovichko on 4/20/17.
//
//

import XCTest

/*
 LongestPassword
 Given a string containing words, find the longest word that satisfies specific conditions.
 
 
 You would like to set a password for a bank account. However, there are three restrictions on the format of the password:
 
 it has to contain only alphanumerical characters (a−z, A−Z, 0−9);
 there should be an even number of letters;
 there should be an odd number of digits.
 You are given a string S consisting of N characters. String S can be divided into words by splitting it at, and removing, the spaces. The goal is to choose the longest word that is a valid password. You can assume that if there are K spaces in string S then there are exactly K + 1 words.
 
 For example, given "test 5 a0A pass007 ?xy1", there are five words and three of them are valid passwords: "5", "a0A" and "pass007". Thus the longest password is "pass007" and its length is 7. Note that neither "test" nor "?xy1" is a valid password, because "?" is not an alphanumerical character and "test" contains an even number of digits (zero).
 
 Write a function:
 
 public func solution(_ S : inout String) -> Int
 
 that, given a non-empty string S consisting of N characters, returns the length of the longest word from the string that is a valid password. If there is no such word, your function should return −1.
 
 For example, given S = "test 5 a0A pass007 ?xy1", your function should return 7, as explained above.
 
 Assume that:
 
 N is an integer within the range [1..200];
 string S consists only of printable ASCII characters and spaces.
 In your solution, focus on correctness. The performance of your solution will not be the focus of the assessment.
*/

class Lesson90_LongestPassword: XCTestCase {
    
    func test() {
        var s = String()
        
        s = "test 5 a0A pass007 ?xy1"
        XCTAssertEqual(solution(&s), 7)
        
        s = "test"
        XCTAssertEqual(solution(&s), -1)
        
        s = "?xy1"
        XCTAssertEqual(solution(&s), -1)
    }
    
    public func solution(_ S : inout String) -> Int {
        let passwords = S.components(separatedBy: " ").sorted { (l, r) -> Bool in
            return l.count > r.count
        }
        
        let letters = CharacterSet.letters
        let digits = CharacterSet.decimalDigits
        
        for password in passwords {
            var lettersCount = 0
            var digitsCount = 0
            for c in password.unicodeScalars {
                if letters.contains(c) {
                    lettersCount += 1
                } else if digits.contains(c) {
                    digitsCount += 1
                } else {
                    break
                }
            }
            if lettersCount + digitsCount == password.count {
                if lettersCount % 2 == 0 && digitsCount % 2 == 1 {
                    return password.count
                }
            }
        }
        
        return -1
    }
}
