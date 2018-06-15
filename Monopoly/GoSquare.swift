//
//  GoSquare.swift
//  Monopoly
//
//  Created by Mani Hamedani on 6/5/18.
//  Copyright © 2018 Manely. All rights reserved.
//

import Foundation

class GoSquare: Square {
    static let playerSalary = 200
    
    override func place(piece: Piece) {
        super.place(piece: piece)
        piece.player?.cash += GoSquare.playerSalary
    }
    
}
