//
//  Lesson91_RectangleBuilderGreaterArea.swift
//  CodilityLessons
//
//  Created by Oleksandr Malovichko on 4/24/17.
//
//

import XCTest

/*
 RectangleBuilderGreaterArea
 Count the distinct rectangle sizes, of area greater than or equal to X, that can be built out of a given set of segments.
 
 
 Halfling Woolly Proudhoof is an eminent sheep herder. He wants to build a pen (enclosure) for his new flock of sheep. The pen will be rectangular and built from exactly four pieces of fence (so, the pieces of fence forming the opposite sides of the pen must be of equal length). Woolly can choose these pieces out of N pieces of fence that are stored in his barn. To hold the entire flock, the area of the pen must be greater than or equal to a given threshold X.
 
 Woolly is interested in the number of different ways in which he can build a pen. Pens are considered different if the sets of lengths of their sides are different. For example, a pen of size 1×4 is different from a pen of size 2×2 (although both have an area of 4), but pens of sizes 1×2 and 2×1 are considered the same.
 
 Write a function:
 
 public func solution(_ A : inout [Int], _ X : Int) -> Int
 that, given an array A of N integers (containing the lengths of the available pieces of fence) and an integer X, returns the number of different ways of building a rectangular pen satisfying the above conditions. The function should return −1 if the result exceeds 1,000,000,000.
 
 For example, given X = 5 and the following array A:
 
 A[0] = 1
 A[1] = 2
 A[2] = 5
 A[3] = 1
 A[4] = 1
 A[5] = 2
 A[6] = 3
 A[7] = 5
 A[8] = 1
 
 the function should return 2. The figure above shows available pieces of fence (on the left) and possible to build pens (on the right). The pens are of sizes 1x5 and 2x5. Pens of sizes 1×1 and 1×2 can be built, but are too small in area. It is not possible to build pens of sizes 2×3 or 3×5, as there is only one piece of fence of length 3.
 
 Write an efficient algorithm for the following assumptions:
 
 N is an integer within the range [0..100,000];
 X is an integer within the range [1..1,000,000,000];
 each element of array A is an integer within the range [1..1,000,000,000].
*/

class Lesson91_RectangleBuilderGreaterArea: XCTestCase {
    
    func tests() {
        var a = [Int]()
        
        a = [1, 2, 3, 5, 8, 13, 21, 34, 55, 1, 2, 3, 5, 8, 13, 21, 34, 55]
        XCTAssertEqual(solution(&a, 100), 16)
        
        a = [1, 2, 5, 1, 1, 2, 3, 5, 1]
        XCTAssertEqual(solution(&a, 5), 2)

        a = []
        XCTAssertEqual(solution(&a, 1), 0)

        a = [1, 1, 2, 2, 3, 3, 100, 100]
        XCTAssertEqual(solution(&a, 10), 3)

        a = [2, 3, 2, 3, 2, 3, 2, 3]
        XCTAssertEqual(solution(&a, 9), 1)
        
        a = [6, 6, 6, 6, 6, 6]
        XCTAssertEqual(solution(&a, 10), 1)
        
        a = [1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7]
        XCTAssertEqual(solution(&a, 5), 18)
    }
    
    func testPerformance() {
        var a = [Int]()
        for i in 1..<50_000 + 1 {
            a.append(contentsOf: [i, i])
        }
        measure {
            _ = self.solution(&a, 1_000_000_000)
        }
    }
    
    public func solution(_ A : inout [Int], _ X : Int) -> Int {
        // key: length, value: count
        var pieces = [Int: Int]()
        for i in 0..<A.count {
            let pieceLength = A[i]
            if let count = pieces[pieceLength] {
                pieces[pieceLength] = count + 1
            } else {
                pieces[pieceLength] = 1
            }
        }
        
        var piecesCount = 0
        
        let sqrtX = Int(sqrt(Double(X)).rounded(.up))
        
        // [X, ...]
        var longPiecesCount = 0
        
        // [sqrtX, X)
        var mediumPieces = [Int]()
        
        // [1, sqrtX)
        var shortPieces = [Int]()
        
        for entry in pieces {
            let count = entry.value
            guard count >= 2 else {
                continue
            }
            
            let length = entry.key
            
            if length >= X {
                if count >= 4 {
                    // It is square, so + 1
                    piecesCount += 1
                }
                
                longPiecesCount += 1
            } else if length >= sqrtX {
                if count >= 4 {
                    // It is square, so + 1
                    piecesCount += 1
                }
                
                mediumPieces.append(length)
            } else {
                shortPieces.append(length)
            }
        }
        
        let ml = mediumPieces.count + longPiecesCount
        piecesCount += ((ml - 1) * ml) / 2
        piecesCount += shortPieces.count * longPiecesCount

        if piecesCount > 1_000_000_000 {
            return -1
        }
        
        let shortPiecesSorted = shortPieces.sorted()
        let mediumPiecesSorted = mediumPieces.sorted()
        
        // Caterpillar method + binary search
        let shortPiecesCount = shortPiecesSorted.count
        var rightEdge = mediumPiecesSorted.count - 1
        
        for i in 0..<shortPiecesCount {
            let shortPiece = shortPiecesSorted[i]

            var left = 0
            var right = rightEdge
            var position: Int?
            
            while left <= right {
                let mid = (left + right) / 2
                let mediumPiece = mediumPiecesSorted[mid]
                if mediumPiece * shortPiece < X {
                    left = mid + 1
                } else {
                    right = mid - 1
                    position = mid
                }
            }
            
            if let position = position {
                let a = shortPiecesCount - i
                let b = rightEdge - position + 1
                piecesCount += a * b
                rightEdge = position - 1
            }
            
            if piecesCount > 1_000_000_000 {
                return -1
            } else if rightEdge < 0 {
                return piecesCount
            }
        }
        
        return piecesCount
    }
}
