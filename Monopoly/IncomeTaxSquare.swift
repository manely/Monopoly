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
        let playerNetWorth = (piece.player?.netWorth)!
        let taxAmount = playerNetWorth > IncomeTaxSquare.amount ? IncomeTaxSquare.amount : playerNetWorth
        piece.player?.cash -= taxAmount
    }
}
