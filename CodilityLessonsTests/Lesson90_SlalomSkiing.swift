//
//  Lesson90_SlalomSkiing.swift
//  CodilityLessons
//
//  Created by Oleksandr Malovichko on 4/27/17.
//
//

import XCTest

/*
 SlalomSkiing
 Given a sequence, find the longest subsequence that can be decomposed into at most three monotonic parts.
 
 
 You are a skier participating in a giant slalom. The slalom track is located on a ski slope, goes downhill and is fenced by barriers on both sides. The barriers are perpendicular to the starting line located at the top of the slope. There are N slalom gates on the track. Each gate is placed at a distinct distance from the starting line and from the barrier on the right-hand side (looking downhill).

 You start from any place on the starting line, ski down the track passing as many gates as possible, and finish the slalom at the bottom of the slope. Passing a gate means skiing through the position of the gate.

 You can ski downhill in either of two directions: to the left or to the right. When you ski to the left, you pass gates of increasing distances from the right barrier, and when you ski to the right, you pass gates of decreasing distances from the right barrier. You want to ski to the left at the beginning.

 Unfortunately, changing direction (left to right or vice versa) is exhausting, so you have decided to change direction at most two times during your ride. Because of this, you have allowed yourself to miss some of the gates on the way down the slope. You would like to know the maximum number of gates that you can pass with at most two changes of direction.

 The arrangement of the gates is given as an array A consisting of N integers, whose elements specify the positions of the gates: gate K (for 0 ≤ K < N) is at a distance of K+1 from the starting line, and at a distance of A[K] from the right barrier.

 For example, consider array A such that:

   A[0] = 15
   A[1] = 13
   A[2] = 5
   A[3] = 7
   A[4] = 4
   A[5] = 10
   A[6] = 12
   A[7] = 8
   A[8] = 2
   A[9] = 11
   A[10] = 6
   A[11] = 9
   A[12] = 3


 The picture above illustrates the example track with N = 13 gates and a course that passes eight gates. After starting, you ski to the left (from your own perspective). You pass gates 2, 3, 5, 6 and then change direction to the right. After that you pass gates 7, 8 and then change direction to the left. Finally, you pass gates 10, 11 and finish the slalom. There is no possible way of passing more gates using at most two changes of direction.

 Write a function:

 public func solution(_ A : inout [Int]) -> Int
 that, given an array A consisting of N integers, describing the positions of the gates on the track, returns the maximum number of gates that you can pass during one ski run.

 For example, given the above data, the function should return 8, as explained above.

 For the following array A consisting of N = 2 elements:

   A[0] = 1
   A[1] = 5
 the function should return 2.

 Write an efficient algorithm for the following assumptions:

 N is an integer within the range [1..100,000];
 each element of array A is an integer within the range [1..1,000,000,000];
 the elements of A are all distinct.
*/

class Lesson90_SlalomSkiing: XCTestCase {
    
    func test() {
//        var a = [Int]()
//
//        a = [15, 13, 5, 7, 4, 10, 12, 8, 2, 11, 6, 9, 3]
//        XCTAssertEqual(solution(&a), 8)
//
//        a = [2, 3, 4, 1, 5, 6, 9, 8, 7, 10]
//        XCTAssertEqual(solution(&a), 9)
//
//        a = [1, 10, 4, 2, 7, 5, 9, 8, 6, 3]
//        XCTAssertEqual(solution(&a), 7)
//
//        a = [1, 5]
//        XCTAssertEqual(solution(&a), 2)
//
//        a = [1, 2, 3, 4, 5]
//        XCTAssertEqual(solution(&a), 5)
//
//        a = [5, 4, 3, 2, 1]
//        XCTAssertEqual(solution(&a), 5)
    }
    
    // Time: 0.048 sec
//    func testPerformance() {
//        var arr = [Int]()
//        let gatesCount = 2_000
//        for i in 0..<gatesCount {
//            arr.append(1_000_000_000 - i)
//            arr.append(i)
//        }
//        measure {
//            _ = self.solution(&arr)
//        }
//    }
    
    public func solution(_ A : inout [Int]) -> Int {
        guard A.count > 3 else {
            return A.count
        }
        assertionFailure("Implement")
        return 0
    }
}
