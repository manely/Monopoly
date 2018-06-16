//
//  IncomeTaxSquare.swift
//  Monopoly
//
//  Created by Mani Hamedani on 6/15/18.
//  Copyright © 2018 Manely. All rights reserved.
//

import Foundation

class IncomeTaxSquare: Square {
    static let threshold = 200
    
    override func place(player: Player) {
        super.place(player: player)
        let tenPercentOfPlayerNetWorth = Float(player.netWorth) * 0.1
        let taxAmount = player.netWorth > IncomeTaxSquare.threshold ? IncomeTaxSquare.threshold : Int(tenPercentOfPlayerNetWorth)
        player.cash -= taxAmount
    }
}
