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
    
    override func place(player: Player) {
        super.place(player: player)
        player.cash += GoSquare.playerSalary
    }
    
}
