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
    let identifier: UInt8
    let name: String
    var piece: Piece? // This allows a player to be created without a piece, waiting for a chosen piece in later stages.
    
    convenience init(id: UInt8) {
        self.init(id: id, piece: nil)
    }

    convenience init(id: UInt8, piece: Piece?) {
        self.init(id: id, name: "Player " + String(id), piece: piece)
    }
    
    init(id: UInt8, name: String, piece: Piece?) {
        self.identifier = id
        self.name = name
        self.piece = piece
    }
    
    func movePiece(offset value: Int) {
        piece?.move(offset: value)
    }
}
