//
//  Piece.swift
//  Monopoly
//
//  Created by Mani Hamedani on 6/4/18.
//  Copyright © 2018 Manely. All rights reserved.
//

import Foundation

class Piece: Equatable {
    let identifier: UInt8
    let name: String
    weak var square: Square?
    weak var player: Player?
    
    init(id: UInt8, name: String, player: Player) {
        self.identifier = id
        self.name = name
        self.player = player
    }
    
    func move(offset offsetValue: Int) {
        if let source = self.square {
            let destination = self.square?.board?.offset(square: source, by: offsetValue)
            self.placeOn(square: destination!)
        }
    }
    
    func placeOn(square: Square) {
        self.square?.remove(piece: self)
        square.place(piece: self)
    }
    
    static func == (lhs: Piece, rhs: Piece) -> Bool {
        return lhs.identifier == rhs.identifier && lhs.name == rhs.name
    }
}
