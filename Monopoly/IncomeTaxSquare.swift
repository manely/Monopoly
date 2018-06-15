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
    
    override func place(player: Player) {
        super.place(player: player)
        let taxAmount = player.netWorth > IncomeTaxSquare.amount ? IncomeTaxSquare.amount : player.netWorth
        player.cash -= taxAmount
    }
}
