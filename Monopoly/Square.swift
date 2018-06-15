//
//  Square.swift
//  Monopoly
//
//  Created by Mani Hamedani on 6/4/18.
//  Copyright © 2018 Manely. All rights reserved.
//

import Foundation

/// An abstract base class which epresents a square and used to model the squares around the board game. 
class Square {
    var identifier: Int = 0
    weak var board: Board?
    var pieces: [Piece?] = []
    
    var title: String {
        return "Square " + String(self.identifier)
    }
    
    init(id: Int, board: Board) {
        self.identifier = id
        self.board = board
    }
    
    func place(piece: Piece) {
        assert(pieces.count < 8, "Square.place(piece:), can not add more than 8 pieces on a square.") // For the sake of defensive programming
        self.pieces.append(piece)
        piece.square = self // Generally, this line is necessary; it is redundant when the move() message is sent to a piece.
    }
    
    func remove(piece: Piece) {
        let index = self.pieces.index(where: { $0 == piece })
        assert(index != nil, "Square.remove(piece: \(piece), the piece is not on the current square.") // For the sake of defensive programming
        if let index = index {
            self.pieces.remove(at: index)
            piece.square = nil
        }
    }
}
