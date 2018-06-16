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
    let totalNumberOfSquares = 40
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
    
    func offset(square: Square, by offsetValue: Int) -> Square {
        var newIndex = square.identifier + offsetValue
        if newIndex >= totalNumberOfSquares {
            newIndex -= totalNumberOfSquares
        }
        if newIndex < 0 {
            newIndex += totalNumberOfSquares
        }
        return squares[newIndex]
    }
    
    /// Although this method adds `Player` visibility to `Board`, the dependency to the `Player` is very weak; it is just passed as a message argument to `Square`, and in fact, the dependency is more on the `Square`, which is natural for a board object to be dependent on squares.
    /// The net result is removing the dependency of `Game` on `Square` in the `setUpPlayers()` method.
    func place(player: Player, on square: Square) {
        square.place(player: player)
    }
    
    /// A player needs to ask the board of its square to compute the destination square and then, ask the destination square to place it, to take a turn.
    /// By adding this method to the `Board` class, the dependency of `Player` on `Square` is removed; a player just asks the board to move it.
    func move(player: Player, by offsetValue: Int) {
        if let source = player.square {
            let destination = self.offset(square: source, by: offsetValue)
            destination.place(player: player)
        }
    }
}

