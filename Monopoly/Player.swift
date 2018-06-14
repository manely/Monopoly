//
//  Player.swift
//  Monopoly
//
//  Created by Mani Hamedani on 6/4/18.
//  Copyright © 2018 Manely. All rights reserved.
//

import Foundation

/// Represents a player in the Monopoly game. 
class Player {
    var piece: Piece
    let identifier: UInt8
    let name: String
    var piece: Piece? // This allows a player to be created without a piece, waiting for a chosen piece in later stages.
    
    convenience init(id: UInt8) {
        self.init(id: id, name: "Player " + String(id))
    }

    init(id: UInt8, name: String) {
        self.piece = Piece(id: id, name: name)
        self.identifier = id
        self.name = name
        self.piece = piece
    }
    
    func takeTurn(moveOffset value: Int) {
        print("\(self.name) is moving from \(String(describing: self.piece.square?.title))")
        piece.move(offset: value)
        print("\(self.name) has moved to \(String(describing: self.piece.square?.title))")
    }
}
