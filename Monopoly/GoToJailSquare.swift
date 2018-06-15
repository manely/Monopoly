//
//  GoToJailSquare.swift
//  Monopoly
//
//  Created by Mani Hamedani on 6/15/18.
//  Copyright © 2018 Manely. All rights reserved.
//

import Foundation

class GoToJailSquare: Square {

    override func place(player: Player) {
        super.place(player: player)
        // FIXME: Here we have some redundancy, as the player is first removed from its square and placed on GoToJail square, and again removed from GoToJail and placed on Jail square.
        (self.board?.jailSquare)!.place(player: player)
    }
}
