//
//  Lesson90_SlalomSkiing.swift
//  CodilityLessons
//
//  Created by Oleksandr Malovichko on 4/27/17.
//
//

import XCTest

class Lesson90_SlalomSkiing: XCTestCase {
    
    func test() {
        var a = [Int]()
        
        a = [15, 13, 5, 7, 4, 10, 12, 8, 2, 11, 6, 9, 3]
        XCTAssertEqual(solution(&a), 8)
        
        a = [1, 5]
        XCTAssertEqual(solution(&a), 2)
    }
    
    public func solution(_ A : inout [Int]) -> Int {
        let count = A.count
        
        var gates = 0
        
        func passGates(position: Int, gate: Int, passedGates: Int, turns: Int, movingLeft: Bool) {
            if turns >= 3 {
                gates = max(gates, passedGates - 1)
                return
            }
            
            gates = max(gates, passedGates)
            
            if position + 1 >= count {
                return
            }
            
            for i in (position + 1)..<count {
                let nextGate = A[i]
                let movingRight = gate > nextGate
                let newTurns = movingRight == !movingLeft ? turns : turns + 1
                passGates(position: i, gate: nextGate, passedGates: passedGates + 1, turns: newTurns, movingLeft: !movingRight)
            }
        }
        
        for i in 0..<count {
            passGates(position: i, gate: A[i], passedGates: 1, turns: 0, movingLeft: true)
        }
        
        return gates
    }

}
