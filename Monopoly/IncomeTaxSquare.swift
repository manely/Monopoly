//
//  IncomeTaxSquare.swift
//  Monopoly
//
//  Created by Mani Hamedani on 6/15/18.
//  Copyright © 2018 Manely. All rights reserved.
//

import Foundation

class IncomeTaxSquare: Square {
    static let amount = 100
    
    override func place(piece: Piece) {
        super.place(piece: piece)
        piece.player?.cash -= IncomeTaxSquare.amount
    }
}
