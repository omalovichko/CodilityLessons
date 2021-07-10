//
//  Lesson91_TreeProduct.swift
//  CodilityLessonsTests
//
//  Created by Oleksandr Malovichko on 25.07.2019.
//

import XCTest

/*
 TreeProduct
 Remove at most two edges from a tree graph to maximize the product of the components' sizes.
 
 Elves in the forest of Glandishar are preparing for an Orc invasion. They have a network of N + 1 guard posts located on the open platforms in the treetops. The posts are numbered from 0 to N and are connected by N bridges, so that one can get from any one guard post to any other guard post in a unique way. In other words, guard posts and bridges form a tree graph.

 The Elves are afraid that if the Orcs manage to get hold of one of the guard posts, then they will have easy access to all the other guard posts. Therefore, the Elves have decided to destroy at most two bridges and split the guard posts into at most three separate areas, so that the guards can move within each area but it's not possible to move between the areas.

 In each area there will be one guard who will move from guard post to guard post during the night. If the Orcs attack, the guards will raise an alarm. However, if the Orcs manage to guess the guard post in which the guards are currently located, they may manage to take out the guards without raising the alarm. The Elves want to avoid the situation that all guard posts fail this way, by maximizing:

 X * Y * Z, if the guard posts have been divided into three areas consisting of X, Y and Z guard posts, respectively;
 X * Y, if the guard posts have been divided into two areas consisting of X and Y posts, respectively;
 N + 1, if the guard posts haven't been divided;
 depending on which option gives the largest result.

 You are given a map of the network in the form of two arrays A, B of length N. For each K (0 ≤ K < N) there is a bridge between posts A[K] and B[K].

 Write a function:

 public func solution(_ A : inout [Int], _ B : inout [Int]) -> String
 that, given two arrays A and B of N integers, returns the largest possible result. Since the result can be large, you should return it as a string.

 For example, given the following arrays:

   A[0] = 0    B[0] = 1
   A[1] = 1    B[1] = 2
   A[2] = 1    B[2] = 3
   A[3] = 3    B[3] = 4
   A[4] = 3    B[4] = 5
   A[5] = 6    B[5] = 3
   A[6] = 7    B[6] = 5


 the function should return "18" since the Elves can destroy bridges 1−3 and 3−5 (marked as dashed lines in the image above). The created areas consist of 3, 3 and 2 guard posts.

 Therefore, the result is 3 * 3 * 2 = 18. It is not possible to obtain a better result.

 Given the following arrays:

   A[0] = 0    B[0] = 1
   A[1] = 1    B[1] = 2
 the function should return "3" (it is optimal not to destroy any bridge).

 Write an efficient algorithm for the following assumptions:

 N is an integer within the range [1..50,000];
 each element of arrays A, B is an integer within the range [0..N];
 distance from guard post 0 to any other post is not greater than 900 bridges.
*/

class Lesson91_TreeProduct: XCTestCase {

//    func test2() {
//        var a = [Int]()
//        var b = [Int]()
//
//        a = [14, 4, 4, 1, 0, 0, 3, 3, 3, 6, 7, 8, 10, 10]
//        b = [4, 13, 1, 0, 2, 3, 5, 6, 7, 10, 8, 9, 11, 12]
//        XCTAssertEqual(solution(&a, &b), "120")
//    }
//
//    func test() {
//        var a = [Int]()
//        var b = [Int]()
//
//        a = [0, 1, 2, 3, 4, 5, 6, 7, 8]
//        b = [1, 2, 3, 4, 5, 6, 7, 8, 9]
//        XCTAssertEqual(solution(&a, &b), "36")
//
//        a = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28]
//        b = [0, 0, 0, 2, 2, 4, 3, 1, 0, 2, 6, 8, 11, 1, 14, 13, 11, 12, 13, 17, 4, 1, 12, 7, 17, 23, 3, 6]
//        XCTAssertEqual(solution(&a, &b), "891")
//
//        a = [0, 1, 1, 0, 2, 2, 0, 7, 8, 8, 8, 8, 7, 7, 7, 7]
//        b = [1, 3, 4, 2, 5, 6, 7, 8, 16, 15, 14, 13, 9, 10, 11, 12]
//        XCTAssertEqual(solution(&a, &b), "175")
//
//        a = [0, 1, 2, 2, 4, 3, 6, 6, 3, 15, 17, 5, 5, 5, 5, 7, 8, 9, 9]
//        b = [1, 2, 3, 4, 5, 6, 16, 15, 11, 17, 19, 10, 7, 8, 9, 12, 18, 14, 13]
//        XCTAssertEqual(solution(&a, &b), "270")
//
//        a = [0, 0, 0, 0, 0, 0, 0, 6, 7]
//        b = [1, 2, 3, 4, 5, 6, 7, 8, 9]
//        XCTAssertEqual(solution(&a, &b), "24")
//
//        a = [0, 0, 0, 2, 2, 4, 4]
//        b = [1, 2, 3, 4, 5, 6, 7]
//        XCTAssertEqual(solution(&a, &b), "18")
//
//        a = [0, 0, 1, 3, 3, 3, 2, 7, 7]
//        b = [1, 2, 3, 4, 5, 6, 7, 8, 9]
//        XCTAssertEqual(solution(&a, &b), "36")
//
//        a = [0, 1, 1, 1]
//        b = [1, 2, 3, 4]
//        XCTAssertEqual(solution(&a, &b), "5")
//
//        a = [0, 2, 3, 4, 4, 5, 5]
//        b = [1, 1, 1, 1, 5, 6, 7]
//        XCTAssertEqual(solution(&a, &b), "16")
//
//        a = [14, 4, 4, 1, 0, 0, 3, 3, 3, 6, 7, 8, 10, 10]
//        b = [4, 13, 1, 0, 2, 3, 5, 6, 7, 10, 8, 9, 11, 12]
//        XCTAssertEqual(solution(&a, &b), "120")
//
//        a = [0, 1, 2, 3]
//        b = [1, 2, 3, 4]
//        XCTAssertEqual(solution(&a, &b), "6")
//
//        a = [0, 1, 1, 3, 3, 6, 7]
//        b = [1, 2, 3, 4, 5, 3, 5]
//        XCTAssertEqual(solution(&a, &b), "18")
//
//        a = [0, 1]
//        b = [1, 2]
//        XCTAssertEqual(solution(&a, &b), "3")
//
//        a = [0]
//        b = [1]
//        XCTAssertEqual(solution(&a, &b), "2")
//
//        a = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
//        b = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]
//        XCTAssertEqual(solution(&a, &b), "21")
//    }
//
//    func testMediumSize() {
//        var a = [0, 2, 4, 7, 9, 10, 15, 26, 29, 31, 32, 33, 34, 36, 8, 37, 42, 44, 45, 46, 51, 56, 57, 60, 61, 41, 63, 67, 68, 71, 72, 73, 78, 80, 81, 16, 84, 85, 86, 87, 90, 91, 93, 59, 98, 99, 105, 106, 77, 107, 117, 118, 115, 124, 129, 132, 122, 133, 134, 142, 143, 149, 150, 48, 152, 159, 156, 165, 11, 166, 168, 128, 92, 169, 170, 171, 172, 174, 176, 179, 181, 183, 160, 186, 154, 22, 187, 189, 167, 191, 192, 39, 195, 196, 197, 52, 96, 199, 74, 200, 158, 182, 201, 139, 164, 202, 193, 161, 203, 204, 206, 211, 217, 38, 220, 221, 222, 108, 223, 225, 62, 226, 125, 227, 54, 229, 230, 231, 237, 238, 239, 82, 243, 147, 246, 250, 3, 153, 76, 251, 252, 254, 19, 255, 40, 257, 261, 137, 190, 30, 262, 146, 47, 126, 265, 266, 120, 14, 269, 236, 270, 173, 271, 210, 273, 163, 274, 276, 97, 101, 278, 109, 281, 282, 283, 111, 13, 287, 289, 35, 100, 290, 188, 178, 291, 1, 209, 277, 293, 17, 141, 43, 198, 21, 194, 218, 294, 184, 151, 247, 295, 103, 296, 235, 127, 298, 268, 299, 88, 212, 6, 70, 275, 302, 303, 208, 116, 69, 155, 27, 241, 148, 140, 304, 12, 145, 306, 305, 307, 28, 18, 259, 284, 308, 301, 83, 75, 310, 89, 144, 58, 311, 313, 53, 94, 66, 314, 300, 65, 64, 214, 24, 253, 112, 234, 286, 249, 180, 315, 130, 316, 131, 135, 288, 317, 219, 138, 79, 228, 5, 216, 175, 185, 205, 263, 104, 123, 232, 110, 25, 245, 215, 157, 285, 256, 318, 102, 258, 233, 55, 121, 264, 23, 177, 20, 319, 207, 114, 49, 213, 244, 312, 224, 162, 260, 95, 280, 248, 267, 113, 309, 50, 242, 292, 240, 119, 279, 136, 297, 272]
//
//        var b = [124, 175, 250, 108, 147, 230, 17, 115, 61, 122, 41, 118, 310, 8, 280, 183, 261, 80, 80, 115, 137, 251, 72, 175, 41, 43, 271, 186, 264, 235, 207, 147, 300, 221, 16, 210, 20, 201, 123, 176, 65, 228, 59, 192, 110, 309, 235, 77, 53, 275, 156, 115, 141, 208, 299, 122, 38, 269, 108, 269, 277, 70, 48, 139, 168, 156, 53, 11, 136, 259, 128, 92, 318, 240, 246, 227, 5, 83, 137, 289, 243, 160, 53, 154, 22, 264, 114, 167, 21, 110, 39, 193, 316, 254, 52, 96, 273, 74, 97, 158, 182, 238, 139, 164, 260, 193, 161, 130, 259, 144, 146, 65, 38, 27, 219, 112, 108, 299, 282, 62, 208, 125, 75, 54, 121, 130, 147, 94, 290, 47, 82, 319, 147, 205, 180, 3, 153, 76, 114, 297, 300, 19, 119, 40, 177, 266, 137, 190, 30, 47, 146, 47, 126, 104, 23, 120, 14, 185, 236, 208, 173, 23, 210, 50, 163, 148, 234, 97, 101, 290, 109, 135, 282, 287, 111, 13, 69, 308, 35, 100, 317, 188, 178, 155, 1, 209, 277, 180, 17, 141, 43, 198, 21, 194, 218, 185, 184, 151, 247, 95, 103, 79, 235, 127, 58, 268, 135, 88, 212, 6, 70, 275, 65, 279, 208, 116, 69, 155, 27, 241, 148, 140, 317, 12, 145, 213, 305, 259, 28, 18, 259, 284, 267, 301, 83, 75, 20, 89, 144, 58, 215, 316, 53, 94, 66, 112, 300, 65, 64, 214, 24, 253, 112, 234, 286, 249, 180, 121, 130, 245, 131, 135, 288, 5, 219, 138, 79, 228, 5, 216, 175, 185, 205, 263, 104, 123, 232, 110, 25, 245, 215, 157, 285, 256, 272, 102, 258, 233, 55, 121, 264, 23, 177, 20, 213, 207, 114, 49, 213, 244, 312, 224, 162, 260, 95, 280, 248, 267, 113, 309, 50, 242, 292, 240, 119, 279, 136, 297, 272, 320]
//
//        let result = solution(&a, &b)
//        XCTAssertEqual(result, "1222776")
//    }
//
//    func testMediumSize2() {
//        var a = [5, 9, 12, 14, 21, 22, 26, 28, 29, 31, 33, 34, 37, 38, 45, 46, 42, 49, 50, 51, 53, 54, 55, 57, 60, 68, 69, 73, 30, 76, 77, 80, 85, 89, 19, 91, 1, 104, 108, 4, 2, 78, 114, 115, 102, 72, 119, 121, 125, 126, 133, 134, 40, 135, 140, 143, 145, 147, 149, 150, 153, 70, 35, 154, 99, 156, 43, 157, 159, 160, 163, 47, 164, 170, 171, 172, 0, 94, 173, 177, 111, 180, 182, 110, 184, 186, 187, 63, 189, 62, 191, 75, 193, 194, 118, 195, 148, 196, 198, 199, 105, 117, 137, 86, 120, 200, 202, 208, 209, 185, 210, 212, 64, 213, 214, 176, 215, 81, 216, 219, 158, 220, 192, 221, 225, 226, 162, 229, 231, 234, 235, 25, 181, 27, 52, 17, 236, 238, 239, 240, 242, 243, 101, 165, 246, 251, 218, 233, 255, 256, 247, 257, 128, 15, 258, 259, 260, 96, 48, 16, 245, 151, 155, 261, 264, 106, 66, 265, 222, 268, 249, 224, 269, 270, 67, 271, 203, 116, 263, 132, 273, 266, 190, 175, 95, 274, 275, 98, 152, 276, 277, 71, 44, 18, 252, 146, 100, 253, 254, 250, 278, 205, 281, 8, 282, 230, 93, 179, 174, 283, 284, 178, 56, 285, 286, 287, 244, 288, 11, 197, 144, 24, 289, 6, 127, 97, 138, 90, 112, 82, 241, 290, 3, 291, 109, 23, 167, 103, 292, 293, 123, 204, 84, 272, 161, 61, 169, 294, 201, 295, 129, 296, 88, 183, 297, 107, 122, 41, 298, 248, 36, 32, 65, 136, 124, 87, 232, 299, 113, 20, 207, 131, 79, 262, 83, 10, 206, 7, 279, 130, 211, 39, 227, 92, 58, 168, 141, 59, 188, 217, 74, 228, 166, 223, 237, 267, 142, 13, 139, 280]
//
//        var b = [16, 23, 87, 101, 118, 28, 274, 142, 46, 216, 274, 114, 40, 52, 152, 42, 49, 291, 143, 296, 107, 300, 235, 193, 174, 225, 43, 30, 185, 267, 114, 87, 18, 19, 207, 1, 274, 282, 4, 2, 78, 156, 252, 102, 72, 142, 274, 172, 187, 132, 136, 40, 8, 273, 144, 176, 88, 208, 116, 260, 70, 35, 52, 99, 242, 43, 36, 177, 205, 191, 47, 113, 176, 129, 168, 0, 94, 175, 227, 111, 83, 220, 110, 36, 226, 278, 63, 247, 62, 261, 75, 250, 229, 118, 161, 148, 245, 32, 23, 105, 117, 137, 86, 120, 141, 165, 245, 226, 185, 41, 27, 64, 161, 109, 176, 250, 81, 283, 237, 158, 294, 192, 278, 161, 254, 162, 27, 92, 247, 58, 25, 181, 27, 52, 17, 211, 7, 277, 247, 138, 295, 101, 165, 267, 106, 218, 233, 168, 201, 247, 260, 128, 15, 230, 39, 287, 96, 48, 16, 245, 151, 155, 107, 264, 106, 66, 291, 222, 139, 249, 224, 6, 174, 67, 274, 203, 116, 263, 132, 98, 266, 190, 175, 95, 279, 32, 98, 152, 131, 82, 71, 44, 18, 252, 146, 100, 253, 254, 250, 283, 205, 241, 8, 92, 230, 93, 179, 174, 279, 285, 178, 56, 39, 131, 127, 244, 65, 11, 197, 144, 24, 59, 6, 127, 97, 138, 90, 112, 82, 241, 36, 3, 204, 109, 23, 167, 103, 292, 206, 123, 204, 84, 272, 161, 61, 169, 188, 201, 280, 129, 139, 88, 183, 122, 107, 122, 41, 39, 248, 36, 32, 65, 136, 124, 87, 232, 299, 113, 20, 207, 131, 79, 262, 83, 10, 206, 7, 279, 130, 211, 39, 227, 92, 58, 168, 141, 59, 188, 217, 74, 228, 166, 223, 237, 267, 142, 13, 139, 280, 300]
//
//        let result = solution(&a, &b)
//        XCTAssertEqual(result, "998096")
//    }
//
//    // Time: 0.127
//    func testPerformance() {
//        var a = [Int]()
//        var b = [Int]()
//        measure {
//            for _ in 0..<1_000 {
//                a = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28]
//                b = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 21, 22, 23, 24, 26, 27]
//                let result = solution(&a, &b)
////                XCTAssertEqual(result, "900")
//            }
//        }
//    }
        
    public func solution(_ A : inout [Int], _ B : inout [Int]) -> String {
        guard A.count > 3 else {
            return "\(A.count + 1)"
        }
        assertionFailure("Implement")
        return ""
    }
}
