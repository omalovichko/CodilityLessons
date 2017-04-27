//
//  Lesson91_DwarfsRafting.swift
//  CodilityLessons
//
//  Created by Oleksandr Malovichko on 4/25/17.
//
//

import XCTest

class Lesson91_DwarfsRafting: XCTestCase {
    
    func test() {
        var s = String()
        var t = String()
        
        s = "1A 2A 1B"
        t = ""
        XCTAssertEqual(solution(2, &s, &t), 0)
        
        s = "3G 4B 8B 7D 8G 5B 4E 1F 4C 6D"
        t = "4H 6B 3A 7H 4A 5G 3C 8D 2D 5H"
        XCTAssertEqual(solution(8, &s, &t), 42)
        
        s = "1B 1A 2A"
        t = "3C 4C"
        XCTAssertEqual(solution(4, &s, &t), -1)
        
        s = ""
        t = "1B"
        XCTAssertEqual(solution(2, &s, &t), 3)
        
        s = "1B 1C 4B 1D 2A"
        t = "3B 2D"
        XCTAssertEqual(solution(4, &s, &t), 6)
        
        s = ""
        t = ""
        XCTAssertEqual(solution(2, &s, &t), 4)
    }
    
    public func solution(_ N : Int, _ S : inout String, _ T : inout String) -> Int {
        let raft = Raft(size: N, barrels: S, occupiedSeats: T)
        return raft.numberOfDwarfsThatCanFit()
    }

    struct Raft {
        typealias Position = (x: Int, y: Int)
        typealias Quarter = (barrels: Int, dwarfs: Int)
        
        let letters = "abcdefghijklmnopqrstuvwxyz".uppercased().characters
        
        var frontLeft = Quarter(0, 0)
        var frontRight = Quarter(0, 0)
        var backLeft = Quarter(0, 0)
        var backRight = Quarter(0, 0)
        
        var frontFreeSpace: Int {
            return quarterSize * 2 - (frontLeft.barrels + frontLeft.dwarfs + frontRight.barrels + frontRight.dwarfs)
        }
        
        var backFreeSpace: Int {
            return quarterSize * 2 - (backLeft.barrels + backLeft.dwarfs + backRight.barrels + backRight.dwarfs)
        }
        
        var leftFreeSpace: Int {
            return quarterSize * 2 - (frontLeft.barrels + frontLeft.dwarfs + backLeft.barrels + backLeft.dwarfs)
        }
        
        var rightFreeSpace: Int {
            return quarterSize * 2 - (frontRight.barrels + frontRight.dwarfs + backRight.barrels + backRight.dwarfs)
        }
        
        var frontWeight: Int {
            return frontLeft.dwarfs + frontRight.dwarfs
        }
        
        var backWeight: Int {
            return backLeft.dwarfs + backRight.dwarfs
        }
        
        var leftWeight: Int {
            return frontLeft.dwarfs + backLeft.dwarfs
        }
        
        var rightWeight: Int {
            return frontRight.dwarfs + backRight.dwarfs
        }
        
        let size: Int
        let quarterSize: Int
        
        init(size: Int, barrels: String, occupiedSeats: String) {
            self.size = size
            quarterSize = size * size / 4

            for barrel in barrels.components(separatedBy: " ") where barrels.characters.count > 0 {
                placeBarrel(position: barrel)
            }
            
            for occupiedSeat in occupiedSeats.components(separatedBy: " ") where occupiedSeats.characters.count > 0 {
                occupySeat(position: occupiedSeat)
            }
        }
        
        func parseStringPosition(position: String) -> Position {
            var position = position
            let charPosX = position.characters.popLast()!
            let posX = letters.distance(from: letters.startIndex, to: letters.index(of: charPosX)!) + 1
            let posY = Int(position)!
            return Position(x: posX, y: posY)
        }
        
        mutating func placeBarrel(position: Position) {
            let left = position.x <= size / 2
            let front = position.y <= size / 2
            if left && front {
                frontLeft.barrels += 1
            } else if left && !front {
                backLeft.barrels += 1
            } else if !left && front {
                frontRight.barrels += 1
            } else {
                backRight.barrels += 1
            }
        }
        
        mutating func occupySeat(position: Position) {
            let left = position.x <= size / 2
            let front = position.y <= size / 2
            if left && front {
                frontLeft.dwarfs += 1
            } else if left && !front {
                backLeft.dwarfs += 1
            } else if !left && front {
                frontRight.dwarfs += 1
            } else {
                backRight.dwarfs += 1
            }
        }
        
        mutating func occupySeat(position: String) {
            let position = parseStringPosition(position: position)
            occupySeat(position: position)
        }
        
        mutating func placeBarrel(position: String) {
            let position = parseStringPosition(position: position)
            placeBarrel(position: position)
        }
        
        func isBalanced() -> Bool {
            return (frontWeight == backWeight) == (leftWeight == rightWeight)
        }
        
        func numberOfDwarfsThatCanFit() -> Int {
            func numberOfDwarfsThatCanFit(lhs: Raft.Quarter, rhs: Raft.Quarter) -> Int {
                let dif = lhs.dwarfs - rhs.dwarfs
                let lhsSpace = quarterSize - (lhs.dwarfs + lhs.barrels)
                let rhsSpace = quarterSize - (rhs.dwarfs + rhs.barrels)
                if dif == 0 {
                    return min(lhsSpace, rhsSpace) * 2
                } else if dif > 0 {
                    let space = rhsSpace - dif
                    if space < 0 {
                        return -1
                    }
                    return min(lhsSpace, space) * 2 + dif
                } else {
                    let space = lhsSpace + dif
                    if space < 0 {
                        return -1
                    }
                    return min(space, rhsSpace) * 2 + abs(dif)
                }
            }
            
            let firstBalance = numberOfDwarfsThatCanFit(lhs: frontLeft, rhs: backRight)
            let secondBalance = numberOfDwarfsThatCanFit(lhs: frontRight, rhs: backLeft)
            if firstBalance >= 0 && secondBalance >= 0 {
                return firstBalance + secondBalance
            } else {
                return -1
            }
        }
        
        func description() -> String {
            return "Free space:\n" +
            "front: \(frontFreeSpace)\n" +
            "back: \(backFreeSpace)\n" +
            "left: \(leftFreeSpace)\n" +
            "right: \(rightFreeSpace)\n" +
            "Dwarfs:\n" +
            "front: \(frontWeight)\n" +
            "back: \(backWeight)\n" +
            "left: \(leftWeight)\n" +
            "right: \(rightWeight)\n" +
            "balanced: \(isBalanced())"
        }
    }
    
}
