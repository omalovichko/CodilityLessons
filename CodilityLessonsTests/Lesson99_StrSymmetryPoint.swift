//
//  Lesson99_StrSymmetryPoint.swift
//  CodilityLessons
//
//  Created by Oleksandr Malovichko on 4/18/17.
//
//

import XCTest

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
