//
//  Lesson14_NailingPlanks.swift
//  CodilityLessonsTests
//
//  Created by Oleksandr Malovichko on 23.06.2019.
//

import XCTest

/*
 NailingPlanks
 Count the minimum number of nails that allow a series of planks to be nailed.
 
 
 You are given two non-empty arrays A and B consisting of N integers. These arrays represent N planks. More precisely, A[K] is the start and B[K] the end of the K−th plank.
 
 Next, you are given a non-empty array C consisting of M integers. This array represents M nails. More precisely, C[I] is the position where you can hammer in the I−th nail.
 
 We say that a plank (A[K], B[K]) is nailed if there exists a nail C[I] such that A[K] ≤ C[I] ≤ B[K].
 
 The goal is to find the minimum number of nails that must be used until all the planks are nailed. In other words, you should find a value J such that all planks will be nailed after using only the first J nails. More precisely, for every plank (A[K], B[K]) such that 0 ≤ K < N, there should exist a nail C[I] such that I < J and A[K] ≤ C[I] ≤ B[K].
 
 For example, given arrays A, B such that:
 
 A[0] = 1    B[0] = 4
 A[1] = 4    B[1] = 5
 A[2] = 5    B[2] = 9
 A[3] = 8    B[3] = 10
 four planks are represented: [1, 4], [4, 5], [5, 9] and [8, 10].
 
 Given array C such that:
 
 C[0] = 4
 C[1] = 6
 C[2] = 7
 C[3] = 10
 C[4] = 2
 if we use the following nails:
 
 0, then planks [1, 4] and [4, 5] will both be nailed.
 0, 1, then planks [1, 4], [4, 5] and [5, 9] will be nailed.
 0, 1, 2, then planks [1, 4], [4, 5] and [5, 9] will be nailed.
 0, 1, 2, 3, then all the planks will be nailed.
 Thus, four is the minimum number of nails that, used sequentially, allow all the planks to be nailed.
 
 Write a function:
 
 public func solution(_ A : inout [Int], _ B : inout [Int], _ C : inout [Int]) -> Int
 that, given two non-empty arrays A and B consisting of N integers and a non-empty array C consisting of M integers, returns the minimum number of nails that, used sequentially, allow all the planks to be nailed.
 
 If it is not possible to nail all the planks, the function should return −1.
 
 For example, given arrays A, B, C such that:
 
 A[0] = 1    B[0] = 4
 A[1] = 4    B[1] = 5
 A[2] = 5    B[2] = 9
 A[3] = 8    B[3] = 10
 
 C[0] = 4
 C[1] = 6
 C[2] = 7
 C[3] = 10
 C[4] = 2
 the function should return 4, as explained above.
 
 Write an efficient algorithm for the following assumptions:
 
 N and M are integers within the range [1..30,000];
 each element of arrays A, B, C is an integer within the range [1..2*M];
 A[K] ≤ B[K].
 
*/

class Lesson14_NailingPlanks: XCTestCase {
    
    func test() {
        var a = [Int]()
        var b = [Int]()
        var c = [Int]()
        
        a = [1, 1, 1, 2, 1]
        b = [5, 5, 5, 5, 4]
        c = [2, 3, 4, 5]
        XCTAssertEqual(solution(&a, &b, &c), 1)
        
        a = [1, 4, 5, 8]
        b = [4, 5, 9, 10]
        c = [4, 6, 7, 10, 2]
        XCTAssertEqual(solution(&a, &b, &c), 4)
        
        a = [28, 18, 43, 15, 26, 18, 21, 49, 6, 23, 12, 18, 50, 17, 31, 21, 37, 23, 9, 22, 21, 40, 29, 10, 34, 15, 26, 11, 21, 40, 26, 38, 38, 30, 33, 20, 31, 39, 5, 47, 19, 7, 8, 18, 4, 20, 21, 33, 24, 47, 33, 17, 44, 35, 49, 37, 49, 11, 14, 49, 2, 47, 46, 7, 8, 46, 48, 44, 37, 38, 16, 1, 32, 45, 48, 26, 1, 9, 23, 12, 2, 10, 25, 7, 6, 9, 2, 40, 44, 11, 32, 44, 13, 17, 45, 39, 32, 40, 29, 16]
        b = [55, 32, 44, 48, 36, 31, 41, 81, 56, 46, 62, 68, 62, 20, 39, 63, 67, 69, 58, 55, 48, 43, 30, 51, 68, 53, 54, 45, 53, 85, 31, 63, 53, 72, 77, 32, 35, 51, 21, 86, 39, 45, 23, 44, 13, 52, 47, 76, 72, 73, 36, 64, 92, 59, 73, 84, 61, 24, 49, 83, 36, 89, 72, 28, 19, 56, 66, 66, 74, 69, 42, 20, 63, 64, 88, 58, 36, 28, 49, 48, 50, 36, 41, 42, 12, 26, 3, 68, 56, 30, 72, 76, 14, 39, 45, 80, 57, 83, 42, 57]
        c = [55, 35, 85, 29, 52, 35, 42, 98, 11, 45, 23, 35, 100, 33, 61, 42, 74, 45, 18, 44, 41, 80, 57, 20, 68, 30, 52, 22, 42, 79, 52, 76, 76, 59, 65, 40, 62, 78, 10, 94, 37, 14, 16, 35, 7, 40, 42, 66, 47, 94, 66, 33, 88, 70, 97, 74, 97, 21, 28, 98, 3, 93, 92, 14, 16, 92, 96, 87, 73, 76, 31, 1, 63, 89, 95, 52, 1, 18, 45, 24, 3, 20, 50, 13, 12, 17, 4, 79, 87, 21, 64, 88, 25, 34, 89, 77, 63, 80, 58, 32, 69, 79, 6, 33, 30, 89, 29, 68, 44, 38, 50, 90, 66, 39, 16, 35, 48, 65, 100, 33, 95, 92, 45, 23, 24, 93, 18, 65, 66, 17, 4, 64, 6, 55, 98, 47, 32, 11, 31, 33, 12, 71, 61, 72, 11, 26, 93, 1, 37, 82, 23, 23, 64, 26, 34, 40, 30, 66, 74, 77, 99, 8, 26, 99, 80, 77, 23, 13, 28, 90, 76, 37, 66, 74, 29, 11, 82, 71, 81, 75, 37, 66, 37, 91, 13, 70, 35, 91, 81, 18, 2, 24, 97, 77, 71, 21, 22, 45, 54, 62, 6, 85, 25, 72, 32, 30, 88, 22, 51, 88, 83, 72, 25, 63, 48, 31, 78, 68, 90, 43, 15, 28, 74, 71, 65, 40, 58, 7, 10, 81, 12, 63, 30, 18, 79, 89, 32, 16, 47, 12, 97, 3, 51, 17, 1, 100, 69, 71, 77, 79, 61, 67, 32, 11, 73, 74, 74, 65, 9, 65, 9, 88, 1, 27, 54, 87, 66, 14, 73, 21, 34, 37, 80, 21, 33, 29, 25, 22, 39, 18, 26, 12, 59, 70, 24, 45, 61, 98, 97, 12, 95, 81, 23, 20, 51, 29, 32, 41, 55, 55]
        XCTAssertEqual(solution(&a, &b, &c), 61)
    }

    func testPerformance() {
        var a = [Int]()
        for i in 1...5_000 {
            a.append(i)
        }
        var b = a
        var c = a
        measure {
            _ = solution(&a, &b, &c)
        }
    }
    
    public func solution(_ A : inout [Int], _ B : inout [Int], _ C : inout [Int]) -> Int {
        var plankIndexes = (0..<A.count).sorted { (l, r) -> Bool in
            return A[l] < A[r]
        }
        
        for nailIndex in 0..<C.count {
            let nailPosition = C[nailIndex]
            var left = 0
            var right = plankIndexes.count - 1
            var position = -1
            
            repeat {
                let mid = (left + right) / 2
                if A[plankIndexes[mid]] > nailPosition {
                    right = mid - 1
                } else {
                    left = mid + 1
                    position = mid
                }
            } while left <= right
            
            while position >= 0 {
                let index = plankIndexes[position]
                if B[index] >= nailPosition && A[index] <= nailPosition {
                    plankIndexes.remove(at: position)
                    position -= 1
                    continue
                }
                break
            }

            if plankIndexes.isEmpty {
                return nailIndex + 1
            }

        }
        return -1
    }
    
}
