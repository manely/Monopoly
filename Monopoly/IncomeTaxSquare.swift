//
//  IncomeTaxSquare.swift
//  Monopoly
//
//  Created by Mani Hamedani on 6/15/18.
//  Copyright © 2018 Manely. All rights reserved.
//

import Foundation

class IncomeTaxSquare: Square {
    static let amount = 200
    
    override func place(piece: Piece) {
        super.place(piece: piece)
        let taxAmount = (piece.player?.cash)! > IncomeTaxSquare.amount ? IncomeTaxSquare.amount : (piece.player?.cash)!
        piece.player?.cash -= taxAmount
    }
}
