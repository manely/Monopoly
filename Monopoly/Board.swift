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
        
    func setUp() {
        for index in 0...39 {
            squares.append(Square(id: index, board: self))
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

