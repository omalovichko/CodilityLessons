//
//  Lesson90_LongestPassword.swift
//  CodilityLessons
//
//  Created by Oleksandr Malovichko on 4/20/17.
//
//

import XCTest

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
            return l.characters.count > r.characters.count
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
            if lettersCount + digitsCount == password.characters.count {
                if lettersCount % 2 == 0 && digitsCount % 2 == 1 {
                    return password.characters.count
                }
            }
        }
        
        return -1
    }
}
