//
//  Lesson91_RectangleBuilderGreaterArea.swift
//  CodilityLessons
//
//  Created by Oleksandr Malovichko on 4/24/17.
//
//

import XCTest

class Lesson91_RectangleBuilderGreaterArea: XCTestCase {
    
    func test() {
        var a = [Int]()
        
        a = [1, 1, 2, 2, 3, 3, 100, 100]
        XCTAssertEqual(solution(&a, 10), 3)
        
        a = [2, 3, 2, 3, 2, 3, 2, 3]
        XCTAssertEqual(solution(&a, 9), 1)
        
        a = [6, 6, 6, 6, 6, 6]
        XCTAssertEqual(solution(&a, 10), 1)
        
        a = [1, 2, 5, 1, 1, 2, 3, 5, 1]
        XCTAssertEqual(solution(&a, 5), 2)
        
        a = [1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7]
        XCTAssertEqual(solution(&a, 5), 18)
    }
    
    func testPerformance() {
        var a = [Int]()
        for _ in 0..<100_000 {
            a.append(Int(arc4random_uniform(1_000_000_000)))
        }
        measure {
            _ = self.solution(&a, 500_000_000)
        }
    }
    
    public func solution(_ A : inout [Int], _ X : Int) -> Int {
        
        var livestockPens = Set<LivestockPen>()
        var fencePieces = Dictionary<Int, Int>()
        
        for a in A {
            
            if let count = fencePieces[a] {
                fencePieces[a] = count + 1
                guard count >= 1 else {
                    continue
                }
                
                for (length, count) in fencePieces {
                    guard count >= 2 else {
                        continue
                    }
                    guard length * a >= X else {
                        continue
                    }
                    if length == a {
                        if count >= 4 {
                            livestockPens.insert(LivestockPen(a, length))
                        }
                    } else {
                        livestockPens.insert(LivestockPen(a, length))
                    }
                }
                
            } else {
                fencePieces[a] = 1
            }
        }
        
        return livestockPens.count
    }
    
    struct LivestockPen: Hashable {
        
        var longestSide: Int
        var shortestSide: Int
        
        init(_ firstSide: Int, _ secondSide: Int) {
            if firstSide > secondSide {
                self.longestSide = firstSide
                self.shortestSide = secondSide
            } else {
                self.longestSide = secondSide
                self.shortestSide = firstSide
            }
        }
        
        public var hashValue: Int {
            return "\(longestSide):\(shortestSide)".hashValue
        }
        
        public static func ==(lhs: LivestockPen, rhs: LivestockPen) -> Bool {
            return lhs.longestSide == rhs.longestSide && lhs.shortestSide == rhs.shortestSide
        }
    }
}
