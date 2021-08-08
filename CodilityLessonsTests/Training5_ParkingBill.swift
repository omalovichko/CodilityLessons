//
//  Training5_ParkingBill.swift
//  CodilityLessonsTests
//
//  Created by Oleksandr Malovichko on 08.08.2021.
//

import Foundation
import XCTest

/*
 ParkingBill
 Given two strings representing times of entry and exit from a car parking lot, find the cost of the ticket according to the given billing rules.
 
 You parked your car in a parking lot and want to compute the total cost of the ticket. The billing rules are as follows:

 The entrance fee of the car parking lot is 2;
 The first full or partial hour costs 3;
 Each successive full or partial hour (after the first) costs 4.
 You entered the car parking lot at time E and left at time L. In this task, times are represented as strings in the format "HH:MM" (where "HH" is a two-digit number between 0 and 23, which stands for hours, and "MM" is a two-digit number between 0 and 59, which stands for minutes).

 Write a function:

 public func solution(_ E : inout String, _ L : inout String) -> Int
 that, given strings E and L specifying points in time in the format "HH:MM", returns the total cost of the parking bill from your entry at time E to your exit at time L. You can assume that E describes a time before L on the same day.

 For example, given "10:00" and "13:21" your function should return 17, because the entrance fee equals 2, the first hour costs 3 and there are two more full hours and part of a further hour, so the total cost is 2 + 3 + (3 * 4) = 17. Given "09:42" and "11:42" your function should return 9, because the entrance fee equals 2, the first hour costs 3 and the second hour costs 4, so the total cost is 2 + 3 + 4 = 9.

 Assume that:

 strings E and L follow the format "HH:MM" strictly;
 string E describes a time before L on the same day.
 In your solution, focus on correctness. The performance of your solution will not be the focus of the assessment.
*/

class Training5_ParkingBill: XCTestCase {

    func test() {
        var e = ""
        var l = ""
        
        e = "10:00"
        l = "13:21"
        XCTAssertEqual(solution(&e, &l), 17)
        
        e = "09:42"
        l = "11:42"
        XCTAssertEqual(solution(&e, &l), 9)
    }
    
    public func solution(_ E : inout String, _ L : inout String) -> Int {
        func timestamp(_ input: String) -> Int {
            let components = input.components(separatedBy: ":").compactMap { Int($0) }
            return components[0] * 60 + components[1]
        }
        // Entrance fee & first or partial hour
        var cost = 2 + 3
        
        var duration = timestamp(L) - timestamp(E)
                
        duration -= 60
        if duration > 0 {
            // 4 - full or partial hour (after the first)
            cost += Int((Double(duration) / 60.0).rounded(.up)) * 4
        }
        return cost
    }
}
