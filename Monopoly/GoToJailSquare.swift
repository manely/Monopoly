//
//  GoToJailSquare.swift
//  Monopoly
//
//  Created by Mani Hamedani on 6/15/18.
//  Copyright © 2018 Manely. All rights reserved.
//

import Foundation

class GoToJailSquare: Square {

    override func place(piece: Piece) {
        super.place(piece: piece)
        piece.placeOn(square: (self.board?.jailSquare)!)
    }
}
