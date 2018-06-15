//
//  Board.swift
//  Monopoly
//
//  Created by Mani Hamedani on 6/4/18.
//  Copyright © 2018 Manely. All rights reserved.
//

import Foundation

/// The Monopoly board which contains 40 squares, each represented by an instance of the `Square` class.
class Board {
    private var squares = [Square]()
    
    var goSquare: GoSquare {
        return self.square(at: 0) as! GoSquare
    }
    
    var jailSquare: JailSquare {
        return self.square(at: 10) as! JailSquare
    }
    
    func setUp() {
        squares.insert(GoSquare(id: 0, board: self), at: 0)
        self.addRegularSquare(from: 1, to: 3)
        squares.insert(IncomeTaxSquare(id: 4, board: self), at: 4)
        self.addRegularSquare(from: 5, to: 9)
        squares.insert(JailSquare(id: 10, board: self), at: 10)
        self.addRegularSquare(from: 11, to: 29)
        squares.insert(GoToJailSquare(id: 30, board: self), at: 30)
        self.addRegularSquare(from: 31, to: 39)
    }
    
    private func addRegularSquare(from: Int, to: Int) {
        for index in from...to {
            squares.append(RegularSquare(id: index, board: self))
        }
    }
    
    func square(at index: Int) -> Square {
        assert(index >= 0 && index < 40, "Board.square(at: \(index)), index must be in 0..<40")
        return squares[index]
    }
    
    func offset(square: inout Square, by offsetValue: Int) {
        square = self.offset(square: square, by: offsetValue)
    }
    
    func offset(square: Square, by offsetValue: Int) -> Square {
        var newIndex = square.identifier + offsetValue
        if newIndex >= 40 {
            newIndex -= 40
        }
        if newIndex < 0 {
            newIndex += 40
        }
        return squares[newIndex]
    }
}

