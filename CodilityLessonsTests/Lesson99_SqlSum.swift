//
//  Lesson99_SqlSum.swift
//  CodilityLessons
//
//  Created by Oleksandr Malovichko on 4/18/17.
//
//

import XCTest

/*
 SqlSum
 Calculate sum of elements.
 
 
 Given a table elements with the following structure:
 
 create table elements (
 v integer not null
 )
 write an SQL query that returns the sum of the numbers in column v.
 
 For example, given:
 
 v
 ---
 2
 10
 20
 10
 your query should return 42.
*/

class Lesson99_SqlSum: XCTestCase {
    
    func test() {
        XCTAssertEqual(solution(), "SELECT SUM(v) FROM elements")
    }
    
    func solution() -> String {
        // SQL (PostgreSQL)
        return "SELECT SUM(v) FROM elements"
    }

}
